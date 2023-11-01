//
//  ListEx03View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct ItemList : Identifiable {
    var id = UUID()
    var itemName: String
    var isChecked: Bool
}

struct ListEx03View: View {
    @State var itemList: [ItemList] = [
        ItemList(itemName: "Item1", isChecked: false),
        ItemList(itemName: "Item2", isChecked: false),
        ItemList(itemName: "Item3", isChecked: false),
        ItemList(itemName: "Item4", isChecked: false),
        ItemList(itemName: "Item5", isChecked: false),
        ItemList(itemName: "Item6", isChecked: false),
        ItemList(itemName: "Item7", isChecked: false),
        ItemList(itemName: "Item8", isChecked: false),
        ItemList(itemName: "Item9", isChecked: false),
        ItemList(itemName: "Item10", isChecked: false)
    ]
    
    @State private var selectedItem = -1
    @State private var switchStates = Array(repeating: false, count: 10)
    
    var body: some View {
        
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        
        List(1...10, id: \.self) { item in
            HStack {
                Text("item \(item)")
                Spacer()
                if selectedItem == item {
                    Image(systemName: "checkmark.square")
                }
            }
            .onTapGesture {
                selectedItem = item
            }
        }
        
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List(1...10, id: \.self) { item in
            HStack {
                Toggle("Item \(item)", isOn: $switchStates[item - 1])
                    .fontWeight(switchStates[item - 1] ? .bold : .regular)
            }
        }
    }
}

#Preview {
    ListEx03View()
}
