//
//  ListEx02View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct ListEx02View: View {
    var body: some View {
        List {
            ForEach(0..<5) { section in
                Section(header: Text("Section \(section + 1)").foregroundStyle(.black)) {
                    ForEach(0..<3) { row in
                        Text("Row \(row + 1)")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .listRowBackground(Color.gray)
        }
    }
}

#Preview {
    ListEx02View()
}
