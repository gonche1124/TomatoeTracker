//
//  Circular Timer.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/6/21.
//

import SwiftUI

struct CircularTimer: View {
    
    var fractionFull: Double = 0.5
    var lineColor:Color = .green
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.gray, lineWidth: 15)
               
            Circle()
                .trim(from: 0, to: CGFloat(fractionFull))
                .stroke(style:innerCircleStyle )
        }
        .frame(width: 250, height: 250)
    }
    
    var isCompleted:Bool{
        fractionFull >= 1.0
    }
    
    var innerCircleStyle:StrokeStyle{
        StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
    }
}

struct CircularTimer_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CircularTimer()
                .padding()
                .colorScheme(.dark)
            
            CircularTimer()
                .padding()
                .colorScheme(.light)
        }
        
    }
}
