//
//  ExAlignmentView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/31/23.
//

import SwiftUI

struct ExAlignmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            HStack(alignment: .bottom) {
                Text("Hello")
                    .font(.largeTitle)
                    .frame(alignment: .leadingLastTextBaseline)
                Text("World")
                    .frame(alignment: .leadingLastTextBaseline)
            }
            
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                
                    .fill(.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            HStack {
                Circle()
                    .fill(.yellow)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    ExAlignmentView()
}
