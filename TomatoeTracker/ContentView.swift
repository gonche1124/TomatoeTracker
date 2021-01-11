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
    
    var id:String{rawValue}
}

struct ContentView: View {
    
    @State private var totalTime:Int = 15 * 60
    @State private var timeLeft:Int = 3 * 60
    @State private var showSettings:Bool = false
    @State private var status:AppState = AppState.stop
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: TomatoeSettings(),
                    label: {
                        Image(systemName: "gear")
                    })
               
                timeSegment
                timerDisplay
            }
            .onChange(of: totalTime){ newTotal in
                timeLeft = newTotal
            }
            .onAppear(){
                timeLeft = totalTime
            }
        }
    }
    
    var timerDisplay:some View{
        GeometryReader{ geo in
            //TODO: Calculate right width of circle and text.
            ZStack{
                CircularTimer(total: totalTime, left: timeLeft)
                InnerView(timeLeft: $timeLeft)
                    .frame(width: geo.size.width - (30*2), height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .onReceive(timer){ timer in
                timeLeft = max(timeLeft - 1,0)
            }
        }
       
    }
    
    var timeSegment: some View{
        Picker("Time", selection:$totalTime){
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width:700)
    }
}
