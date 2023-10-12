//
//  ContentView.swift
//  Ex03Timer
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct Ex06SecToHMSView: View {
    @State private var secondsInput = ""
    @State private var convertedTime = "00:00:00"
    
    var body: some View {
        VStack {
            TextField("Enter seconds", text: $secondsInput)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)
            
            Text(convertedTime)
        }
        .onChange(of: secondsInput) { newValue in
            convertSecondsToTimeFormat(secondsString: newValue)
        }
    }
    
    func convertSecondsToTimeFormat(secondsString: String) {
        guard let totalSeconds = Int(secondsString) else { return
            convertedTime = "00:00:00"
        }
        
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = (totalSeconds % 3600) % 60
        
        convertedTime = String(format:"%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    Ex06SecToHMSView()
}
