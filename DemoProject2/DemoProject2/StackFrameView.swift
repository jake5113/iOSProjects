//
//  StackFrameView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct StackFrameView: View {
    var body: some View {
        
        VStack {
            Text("Hello, World!")
            ZStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.30")
            }
        }
    }
}

#Preview {
    StackFrameView()
}

