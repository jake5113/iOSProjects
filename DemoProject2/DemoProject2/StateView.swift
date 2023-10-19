//
//  StateView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/13/23.
//
// p.205

import SwiftUI

struct StateView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $wifiEnabled, label: {
                Text("Enable Wi-Fi")
            })
            TextField("Enter user name", text: $userName)
            
            Text( userName )
//            Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
        .padding()
    }
}

struct WifiImageView: View {
    
    @Binding var wifiEnabled : Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

class DemoData: ObservableObject {
    @Published var userCount = 0
    @Published var correntUser = ""
    
    init() {
        updateData()
    }
    
    func updateData() {
        
    }
    
}

#Preview {
    StateView()
}
