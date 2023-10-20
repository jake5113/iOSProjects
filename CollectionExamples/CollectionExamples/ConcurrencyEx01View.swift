//
//  ConcurrencyEx01View.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/19/23.
//

import SwiftUI

struct ConcurrencyEx01View: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    
    func doSomething() async {
        // async let을 사용하여 두 개의 비동기 작업을 동시에 실행
        async let result1 = sumFrom(1, 50)
        async let result2 = sumFrom(51, 100)
        // 결과를 출력
        var a = await result1
        var b = await result2
        print("\(a + b)")
    }
    
    func sumFrom(_ s: Int, _ e: Int) async -> Int {
        var sum = 0
        for i in s...e {
            sum += i
        }
        return sum
    }
}

#Preview {
    ConcurrencyEx01View()
}
