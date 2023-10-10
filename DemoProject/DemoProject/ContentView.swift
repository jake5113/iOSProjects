//
//  ContentView.swift
//  DemoProject
//
//  Created by 이종원 on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var msg: String =
    "Hello, world"
    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(msg)
                .foregroundColor(.red)
            
            HStack {
                TextField("Edit Here", text: $msg)
                    .textFieldStyle(
                        RoundedBorderTextFieldStyle())
                
                Button(action: buttonPressed, label: {
                    Text("Send")})
            }
        }
        .padding(10)
        .background(Color.indigo)
    }
    func buttonPressed() {
        msg = "haha"
    }
}

#Preview {
    ContentView()
}
