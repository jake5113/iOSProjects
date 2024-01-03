//
//  ContentView.swift
//  PapagoApi
//
//  Created by 이종원 on 12/1/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var network = PapagoAPI.shared

    var body: some View {
        VStack {
            Text("hi")
        }
        .onAppear() {
            network.feachData()
        }
    }
}

#Preview {
    ContentView()
}
