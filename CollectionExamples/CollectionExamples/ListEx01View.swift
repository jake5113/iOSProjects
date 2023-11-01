//
//  ListEx01View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct ListEx01View: View {
    
    struct ItemList : Identifiable {
        var id = UUID()
        var itemName: String
    }
    
    @State var itemList: [ItemList] = [
        ItemList(itemName: "Item1"),
        ItemList(itemName: "Item2"),
        ItemList(itemName: "Item3"),
        ItemList(itemName: "Item4"),
        ItemList(itemName: "Item5"),
        ItemList(itemName: "Item6"),
        ItemList(itemName: "Item7"),
        ItemList(itemName: "Item8"),
        ItemList(itemName: "Item9"),
        ItemList(itemName: "Item10")
    ]
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        
        List {
            ForEach(itemList) { item in
                Text(item.itemName)
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    ListEx01View()
}
