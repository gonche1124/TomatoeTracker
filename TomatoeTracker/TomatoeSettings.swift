//
//  TomatoeSettings.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/9/21.
//

import SwiftUI

import UserNotifications

struct TomatoeSettings: View {
    
    @State private var enabledNoti:Bool = false
    @State private var doNotDisturb:Bool = false
    @State private var soundWhenDone:Bool = false
    
    @AppStorage("status") var status: AppState = .stop
    
    var body: some View {
        VStack{
            Text("Cycle through")
            
            Toggle(isOn: $doNotDisturb){
                Text("Do not disturb")
            }
            
            Toggle(isOn: $enabledNoti){
                Text("Send Notification")
            }
            .onChange(of: enabledNoti) { newValue in
                if newValue {
                    requestAuthorization()
                }
            }
            
            Toggle(isOn: $soundWhenDone){
                Text("Sound when done?")
            }
            if soundWhenDone {
                Picker(selection: .constant(1), label: Text("Picker"), content: {
                    
                    ForEach((1...10), id:\.self) { num in
                        Text("\(num)").tag(num)
                    }
                  
                })
            }
            
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        
        
        
        .onChange(of: status){ newStatus in
            if newStatus == .done {
                if enabledNoti {
                    createNotification()
                }
            }
        }
    }
    
    func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
            if success {
                print("Enabled Notification.")
            }
        }
    }
    
    func createNotification(){
        //Create notification.
        let content = UNMutableNotificationContent()
        content.title = "Tomatoe done"
        content.subtitle = "Finished the interval XX"
        content.sound = UNNotificationSound.default
        
        //Set up trigger.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString
                                            , content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
    }
}

struct TomatoeSettings_Previews: PreviewProvider {
    static var previews: some View {
        TomatoeSettings()
    }
}
