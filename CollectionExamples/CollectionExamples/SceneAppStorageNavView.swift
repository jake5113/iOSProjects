//
//  SceneAppStorageNavView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct SceneAppStorageNavView: View {
    var body: some View {
        
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            
            AppStorageView()
                .tabItem { 
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    SceneAppStorageNavView()
}
