//
//  InnerView.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/6/21.
//

import SwiftUI

struct InnerView: View {
    
    @Binding var timeLeft:Int
    
    var body: some View {
        VStack(spacing:0) {
            Text(timeAsString)
                .font(customFont)
                .minimumScaleFactor(0.45)
                .lineLimit(1)
            ControlsRow()
                //.padding()
        }
    }
    
    var customFont:Font{
        .system(size: 75, weight: .light, design: .rounded)
    }
    
    var timeAsString:String{
        let (min, sec) = timeLeft.quotientAndRemainder(dividingBy: 60)
        return String(format: "%d:%02d", min, sec)
    }
}

//MARK: - Preview
struct InnerView_Previews: PreviewProvider {
    static var previews: some View {
        InnerView(timeLeft: .constant(23))
            .frame(width: 400)
    }
}
