//
//  ContentView.swift
//  Ex02Average
//
//  Created by 이종원 on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var swiftScore: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "swift")
                .imageScale(.large)
            TextField("Swift", text: $swiftScore)
                .overlay(RoundedRectangle(
                    cornerRadius: 3)
                    .stroke()
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
