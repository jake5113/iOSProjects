//
//  Ex10BigMinSmallView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct Ex10BigMinSmallView: View {
    @State var number1: String = ""
    @State var number2: String = ""
    @State var result: String = ""
    
    var body: some View {
        HStack{
            TextField("숫자1 입력", text: $number1)
                .textFieldStyle(.roundedBorder)
                .border(.red)
                .keyboardType(.decimalPad)
            TextField("숫자2 입력", text: $number2)
                .textFieldStyle(.roundedBorder)
                .border(.yellow)
                .keyboardType(.decimalPad)
        }.padding()
        
        Button(action: {
            guard let num1 = Int(number1), let num2 = Int(number2) else {
                return
            }
            result = String( num1 > num2 ? num1 - num2 : num2 - num1 )
        }, label: {
            Label(
                title: { Text("minus") },
                icon: { Image(systemName: "minus") }
            )
        })
        
        Text("result : \(result)")
    }
}

#Preview {
    Ex10BigMinSmallView()
}
