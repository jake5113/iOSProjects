//
//  ListEx05View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct ListEx05View: View {
    
    @State var items = Array(1...10)
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List(items, id: \.self) { item in
            HStack {
                Text("Item \(item)")
                Spacer()
                Button(action: {
                    if let index = items.firstIndex(of: item) {
                        items.remove(at: index)
                    }
                }, label: {
                    Image(systemName: "trash")
                })
            }
        }
    }
}


#Preview {
    ListEx05View()
}
