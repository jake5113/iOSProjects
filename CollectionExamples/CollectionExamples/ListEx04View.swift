//
//  ListEx04View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct ListEx04View: View {
 
    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }
    
    let items = [
        Item(image: "apple", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "macOS"),
        Item(image: "ios", text: "iOS")
    ]
    
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        Text("\(multiSelection.count)")
            .font(.largeTitle)
            .padding()
        
        NavigationStack {
            
            List(items, selection: $multiSelection) { item in
                HStack {
                    Text(item.text)
                }
            }
            .navigationTitle("SwiftUI List QUiz")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ListEx04View()
}
