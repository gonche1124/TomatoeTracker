//
//  Circular Timer.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/6/21.
//

import SwiftUI

struct CircularTimer: View {

    var total:Int = 100
    var left:Int = 40
    var lineColor:Color = .green
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color("CircleBack"), lineWidth: 15)
               
            Circle()
                .trim(from: 0, to: CGFloat(fractionFull))
                .stroke(Color("CircleFront"), style:innerCircleStyle )
        }
        .rotationEffect(.init(degrees: -90.0))
    }
    
    var fractionFull:Double{
        Double(left)/Double(total)
    }
    
    var isCompleted:Bool{
        fractionFull >= 1.0
    }
    
    var innerCircleStyle:StrokeStyle{
        StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
    }
}

//MARK: - Preview
struct CircularTimer_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CircularTimer()
                .colorScheme(.dark)
            
            CircularTimer()
                .padding()
                .colorScheme(.light)
        }
        .padding()
        .frame(width: 250, height: 250)
        
    }
}
