//
//  ContentView.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/6/21.
//

import SwiftUI

//TODO: Move to own file
enum AppState:String, CaseIterable, Identifiable{
    case play, pause, stop, done
    
    var id:String{
        rawValue
    }
}

struct ContentView: View {
    
    @AppStorage("totalTime") var totalTime: Int = 15 * 60
    @AppStorage("timeLeft") var timeLeft: Int = 3 * 60
    @AppStorage("showSettings") var showSettings: Bool = false
    @AppStorage("status") var status: AppState = .stop
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        //NavigationView {
            VStack {
                Text("Example: \(status.rawValue)")
                TomatoeSettings()
                settingsButton
                timeSegment
                timerDisplay
            }
            .onChange(of: totalTime){ newTotal in
                    timeLeft = newTotal
                status = .done
            }
            .onChange(of: status){ status in
                if status == .stop {
                    timeLeft = totalTime
                }
            }
            .onReceive(timer){ timer in
                if status == .play {
                    withAnimation{
                        timeLeft = max(timeLeft - 1,0)
                        if timeLeft == 0 {
                            status = .done
                        }
                    }
                }
            }
            .onAppear(){
                timeLeft = totalTime
            }
        //}
    }
    
    var settingsButton: some View{
        NavigationLink(
            destination: TomatoeSettings(),
            label: {
                Image(systemName: "gear")
            })
    }
    
    var timerDisplay:some View{
        GeometryReader{ geo in
            ZStack(alignment: .center ){
                CircularTimer(total: totalTime, left: timeLeft)
                InnerView(timeLeft: $timeLeft)
                    .frame(width: max((geo.size.minWidthHeight-30)/sqrt(2.0),0))
                    .aspectRatio(1, contentMode: .fit)
                    //.aspectRatio(contentMode: .fit)
             
            }
            
            .padding()
   
        }
       
    }
    
    var timeSegment: some View{
        Picker("Time", selection:$totalTime){
            Text("1/2").tag(30)
            Text("5").tag(5*60)
            Text("10").tag(10*60)
            Text("15").tag(15*60)
            Text("25").tag(25*60)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .labelsHidden()
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.frame(maxWidth:.infinity)
    }
}

//TODO: Move to own file
extension CGSize{
    var minWidthHeight:CGFloat{
        min(width, height)
    }
}
