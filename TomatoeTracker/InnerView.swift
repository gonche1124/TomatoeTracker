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
        GeometryReader { geo in
            VStack(spacing:0) {
                Text(timeAsString)
                    .font(customFont)
                    .minimumScaleFactor(0.05)
                    .lineLimit(1)
                    .layoutPriority(1)
                    //.foregroundColor(Color("CircleBack"))
                    //.frame(height:geo.size.height*2/3)
                ControlsRow()
                    .padding(.horizontal)
                    .frame(height:geo.size.height/3)
                    //.foregroundColor(Color("CircleFront"))
            }
            .frame(maxHeight:.infinity)
            .frame(maxWidth:.infinity)
            
        }
    }
    
    var customFont:Font{
        .system(size: 100, weight: .semibold, design: .monospaced)
        //.system(size: 100, weight: .light, design: .rounded)
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
