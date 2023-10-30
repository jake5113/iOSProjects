//
//  StackAlignEx01View.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct StackAlignEx01View: View {
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                    .font(.largeTitle)
                Text("World")
            }
        }
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.red)
                .alignmentGuide(.leading, computeValue: { dimension in
                    dimension.width
                })
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    StackAlignEx01View()
}
