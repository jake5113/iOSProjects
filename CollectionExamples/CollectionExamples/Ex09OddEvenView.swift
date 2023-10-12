//
//  Ex09OddEvenView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct Ex09OddEvenView: View {
    @State var number: String = ""
    @State var resultNumber: String = ""
    var body: some View {
        
        Label {
          Text("홀짝 판별기")
            .font(.largeTitle)
        } icon: {
          RoundedRectangle(cornerRadius: 10)
            .fill(.blue)
            .frame(width: 32, height: 32)
        }

        TextField("숫자를 입력하세요", text: $number)
            .border(Color.black)
            .textFieldStyle(.roundedBorder)
            .padding(20)
            .keyboardType(.decimalPad)
        
        Button(action: {
            guard let checkNum = Int(number) else {
                resultNumber = "숫자를 입력하세요"
                return
            }
            
            if checkNum % 2 == 0 {
                resultNumber = "짝수"
            } else {
                resultNumber = "홀수"
            }
        }, label: {Image(systemName: "play.fill").imageScale(.large)})
        
        Text(resultNumber)
            .padding(.top, 15)
        
        Label{
            Text("홀짝 판별기")
                .font(.largeTitle)
                .foregroundStyle(.yellow)
                .bold()
                .background(.cyan)
        } icon: {
            Image(systemName: "externaldrive.badge.checkmark")
                .padding(10)
                .border(.yellow)
        }
    }
}

#Preview {
    Ex09OddEvenView()
}
