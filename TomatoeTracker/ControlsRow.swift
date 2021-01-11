//
//  ControlsRow.swift
//  TomatoeTracker
//
//  Created by Andres Gonzalez Casabianca on 1/10/21.
//

import SwiftUI

struct ControlsRow: View {
    
    @State var currentState:AppState = AppState.play
    
    var body: some View {
        VStack {
            switch currentState {
            case .play:
                HStack(spacing:20){
                    pauseButton
                    stopButton
                }
            case .stop, .done:
                playButton
            case .pause:
                HStack(spacing:20){
                    playButton
                    stopButton
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .aspectRatio(contentMode: .fit)
        //.frame(width: .infinity, height: .infinity)
        
    }
    
    /// Play Button.
    var playButton: some View {
        Button(action: {currentState = .play}
               , label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               })
            
    }
    
    var stopButton: some View{
        Button(action: {currentState = .stop}
               , label: {
                Image(systemName: "stop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               })
    }
    
    var pauseButton: some View{
        Button(action: {currentState = .pause}, label: {
            Image(systemName: "pause.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
    }
    
}

//MARK: - Preview
struct ControlsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(AppState.allCases){ state in
                ControlsRow(currentState: state)
                    .previewDisplayName(state.rawValue)
            }
        }
        .frame(width: 200)
    }
}
