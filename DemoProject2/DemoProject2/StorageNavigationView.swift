//
//  StorageNavigationView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct StorageNavigationView: View {
    
    @AppStorage("selectedItem") var selectedItem: String?
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(
                    destination: Text(item),
                    tag: item,
                    selection: $selectedItem) {
                        Text(item)
                    }
            }
        }
    }
}

#Preview {
    StorageNavigationView()
}
