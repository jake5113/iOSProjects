//
//  ContentView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink(destination: Ex09OddEvenView()) {
                Text("Ex09OddEvenView")
                    .padding()
            }
            NavigationLink(destination: Ex10BigMinSmallView()) {
                Text("Ex10OddEvenView")
                    .padding()
            }
            NavigationLink(destination: Ex11BasketBallView()) {
                Text("Ex11BasketBallView")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
