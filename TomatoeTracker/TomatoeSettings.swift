//
//  TomatoeSettings.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/9/21.
//

import SwiftUI

struct TomatoeSettings: View {
    
    @State private var enabledNoti:Bool = false
    
    var body: some View {
        VStack{
            Text("Cycle through")
            Text("Do not disturb")
            Text("Notification")
            Toggle(isOn: $enabledNoti){
                Text("Send Notification")
            }
            Text("Sound when done")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

struct TomatoeSettings_Previews: PreviewProvider {
    static var previews: some View {
        TomatoeSettings()
    }
}
