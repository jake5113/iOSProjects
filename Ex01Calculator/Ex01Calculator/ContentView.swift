//
//  ContentView.swift
//  Ex01Calculator
//
//  Created by 이종원 on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var num1 :String = ""
    @State var num2 :String = ""
    @State var sumNum :String = ""
    @State var minNum :String = ""
    @State var mulNum :String = ""
    @State var divNum :String = ""
    
    @State var mandarin :String = ""
    @State var perBox :String = ""
    @State var boxes :String = ""
    @State var remainder :String = ""
    
    @State var number :String = ""
    @State var result :String = ""
    
    
    var body: some View {
        
        VStack {
            Text("사칙연산!!").font(.title2)
            TextField("number1", text: $num1)
                .overlay(RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.red))
            
            TextField("number2", text: $num2)
                .overlay(RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.red))

            Button(action: {
                if !num1.isEmpty && !num2.isEmpty {
                    sumNum = String(Int(num1)! + Int(num2)!)
                    minNum = String(Int(num1)! - Int(num2)!)
                    mulNum = String(Int(num1)! * Int(num2)!)
                    divNum = String(Float(num1)! / Float(num2)!)
                }
            }, label: {Text("결과는?")})
            
            Text("더하기 결과: \(sumNum)")
            Text("빼기 결과: \(minNum)")
            Text("곱하기 결과: \(mulNum)")
            Text("나누기 결과: \(divNum)")
        }
        .padding(25)
        
        VStack {
            Text("귤박스!!").font(.title2)
            TextField("귤", text: $mandarin)
                .overlay(RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.blue))
            
            TextField("한 박스에 몇개?", text: $perBox)
                .overlay(RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.blue))
            
            Button(action: {
                if !mandarin.isEmpty && !perBox.isEmpty {
                    remainder = String(Int(mandarin)! % Int(perBox)!)
                    boxes = String(Int(mandarin)! / Int(perBox)!)
                }
            }, label: {
                Text("결과는?")
            })
            
            Text("귤 박스의 수 : \(boxes)")
            Text("박스에 담고 남은 귤 수 : \(remainder)")
        }
        .padding(25)
        
        VStack {
            Text("백의 자리 이하 버리기!!").font(.title2)
            TextField("숫자 입력", text: $number)
                .overlay(RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.teal))
            
            Button(action: {
                if !number.isEmpty {
                    result = String(Int(number)! / 100 * 100 )
                }
            }, label: {
                Text("결과는?")
            })
            .disabled(number.isEmpty)
            
            
            Text("결과! : \(result)")
        }
        .padding(25)
    }
}

#Preview {
    ContentView()
}
