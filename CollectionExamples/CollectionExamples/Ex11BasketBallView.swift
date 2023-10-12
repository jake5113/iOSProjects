//
//  Ex11BasketBallView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct Ex11BasketBallView: View {
    @State var num = "0"
    var body: some View {
        VStack {
            Text(num)
                .font(.largeTitle)
            Button(action: {
                num = String(Int(num)! + 1)
            }, label: {
                Image("basketball")
                        .resizable()
                    .frame(width: 100, height: 100)
            })
        }
    }
}

#Preview {
    Ex11BasketBallView()
}
