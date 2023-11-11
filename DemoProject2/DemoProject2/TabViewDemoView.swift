//
//  TabViewDemoView.swift
//  DemoProject2
//
//  Created by 이종원 on 11/9/23.
//

import SwiftUI

struct TabViewDemoView: View {
    
    var body: some View {
        TabView {
            Text("First Content View")
                .tabItem { 
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag(1)
            Text("Second Content View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag(2)
            Text("Third Content View")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag(3)
        }
        .font(.largeTitle)
        .tabViewStyle(PageTabViewStyle())
        .background(.teal)
    }
}

#Preview {
    TabViewDemoView()
}
