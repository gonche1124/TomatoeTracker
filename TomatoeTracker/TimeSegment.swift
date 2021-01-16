//
//  TimeSegment.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/16/21.
//

import SwiftUI
import Combine

struct TimeSegment: View {
    
    @State var otherValue:String=""
    @State private var selectedValue:Int = 5*60
    @AppStorage("totalTime") var totalTime: Int = 15 * 60
    
    
    var body: some View {
        VStack(spacing:5) {
            Text("Time: \(totalTime)")
            
            Picker("Time", selection:$selectedValue){
                Text("1/2").tag(30) //Delete after testing.
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                Text("25").tag(25)
                Text(otherTitle).tag(-1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            .onChange(of: selectedValue){ newValue in
                if newValue != -1 && newValue != -2 {
                    totalTime = newValue * 60
                }
            }
            
            if selectedValue == -1 {
                TextField("other VV", text: $otherValue,onCommit: {
                    totalTime = (Int(otherValue) ?? 0 ) * 60
                    selectedValue = -2
                })
                .onReceive(Just(otherValue)){ newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.otherValue = filtered
                    }
                }

            }
        }
    }
    
    var otherTitle:String {
        otherValue.isEmpty ? "Other" : "Other (\(otherValue))"
    }
    
}

struct TimeSegment_Previews: PreviewProvider {
    static var previews: some View {
        TimeSegment()
            .padding()
    }
}
