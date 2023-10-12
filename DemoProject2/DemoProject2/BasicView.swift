//
//  BasicView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct BasicView: View {
    @ObservedObject var num = NumberOnly()
    
    @State private var score:Int = 0
    @State private var msg = ""
    
    let carStack = HStack {
        HStack {
            Text("Car Image")
                .font(.headline)
            .foregroundColor(.red)
        }
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        VStack {
            carStack
            Image(systemName: "car.top.door.front.left.and.front.right.and.rear.left.and.rear.right.open")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(.black)
                .padding(10)    // 수정자 순서 주의!
                .border(Color.black)
            
            Text("\(msg)")
                .modifier(StandardTitle())
            
            HStack {
                TextField("Input",text: $msg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: btnPressed, label: {
                    Image(systemName: "square.and.arrow.up")
                })
            }
            
            // 숫자 입력
            HStack {
                TextField("Score", value: $score, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Number", text: $num.value)
                    .textContentType(.creditCardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            // 하위뷰
            MyStackView()
                .font(.custom("Copperplate", size: 40))
            
            // 커스텀 컨테이너 뷰
            MyVStack {
                Text("Hello")
                Text("Bye")
                    .font(.footnote)
            }
        }
        .padding(100)
        .background(Color.yellow)
    }
    
    func btnPressed() {
        msg = "Bye, world!"
    }
}

// 하위뷰로 작업하기
struct MyStackView: View {
    var body: some View
    {
        HStack {
            Text ("name")
            Text ("age")
        }
    }
}

// 커스텀 수정자 (공통된 수정사항)
struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black,radius: 5, x: 0, y: 5)
    }
}

// 커스텀 컨테이너 뷰, ViewBuilder 속성을 사용
struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// 숫자만 강제하는
class NumberOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter{ $0.isNumber }
            if value != filtered {
                value = filtered
            }
        }
    }
}

#Preview {
    BasicView()
}
