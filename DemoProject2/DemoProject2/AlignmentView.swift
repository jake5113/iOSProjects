//
//  AlignmentView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct AlignmentView: View {
    var body: some View {
        VStack(spacing: 50) {
            VStack (alignment: .trailing){
                Image(systemName: "rainbow")
                Text("This is some text")
                Text("This is some longer text")
                Text("This is short")
            }
            HStack (alignment: .lastTextBaseline, spacing: 20) {
                Text("This is some text")
                Text("This is some longer text")
                    .alignmentGuide(.leading, computeValue: { dimension in
                        60.0
                    })
                Text("This is short")
            }
        }
    }
}

#Preview {
    AlignmentView()
}
