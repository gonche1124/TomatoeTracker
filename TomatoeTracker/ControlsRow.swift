//
//  ControlsRow.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/10/21.
//

import SwiftUI

struct ControlsRow: View {
    
    //@State var currentState:AppState = AppState.play
    @AppStorage("status") var currentState: AppState = .stop
    
    var body: some View {
        Group {
            
            switch currentState {
            case .play:
                HStack(spacing:20){
                    pauseButton
                    stopButton
                }
            case .stop, .done:
                HStack {
                    playButton
                }
            case .pause:
                HStack(spacing:20){
                    playButton
                    stopButton
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxHeight:100)
        //.aspectRatio(contentMode: .fit)
        
        
        //.frame(width: .infinity, height: .infinity)
        
    }
    
    /// Play Button.
    var playButton: some View {
        Button(action: {currentState = .play}
               , label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.frame(maxHeight:100)
               })
            
    }
    
    var stopButton: some View{
        Button(action: {currentState = .stop}
               , label: {
                Image(systemName: "stop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.frame(maxHeight:100)
               })
    }
    
    var pauseButton: some View{
        Button(action: {currentState = .pause}, label: {
            Image(systemName: "pause.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(maxHeight:100)
        })
    }
    
}

//MARK: - Preview
struct ControlsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(AppState.allCases){ state in
                ControlsRow(currentState: state)
                    .padding()
                    .previewDisplayName(state.rawValue)
            }
        }
        //.frame(width: 400)
    }
}
