//
//  AppStorageView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("mytext") var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
