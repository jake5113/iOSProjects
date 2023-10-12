//
//  ContentView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(destination: BasicView(), label: {
                    Text("Next View")
                        .font(.largeTitle)
                })
            }
            .padding()
            .background(Color.teal)
        }
    }
}

#Preview {
    ContentView()
}
