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
                    Text("BasicView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: StackFrameView(), label: {
                    Text("StackFrameView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: StateView(), label: {
                    Text("StateView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: ConcurrencyView(), label: {
                    Text("ConcurrencyView")
                        .font(.largeTitle)
                })
            }
            .padding()
            .background(.teal)
        }
    }
}

#Preview {
    ContentView()
}
