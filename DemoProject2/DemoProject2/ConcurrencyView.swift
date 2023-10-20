//
//  ConcurrencyView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/19/23.
//

/*
 스위프트 구조화된 동시성
 
 동시성
 - 여러 작업을 병렬로 수행하는 소프트웨어 기능
 - Swift는 구조화된 방식으로 비동기(asynchronous)와 병렬(parallel) 코드 작성을 지원
 - 비동기 코드는 일시적으로 중단되었다가 다시 실행될 수 있지만 한번에 프로그램의 한 부분만 실행
 - 병렬 코드는 동시에 코드의 여러 부분이 실행됨을 의미
 - 동시성 이라는 용어를 사용하여 비동기와 병렬 코드의 일반적인 조합을 나타냄
 
 
 스레드(thread)
 - 메인 프로세스 내에서 실행되는 미니 프로세스로 생각할 수 있으며, 그 목적은 애플리케이션 코드 내에서 병렬 실행의 형태를 가능하게 하는 것
 - Swift 에서 동시성 모델은 쓰레드의 최상단에 구축되지만 직접적으로 상호작용할 필요는 없음(구조화된 동시성이 모든 복잡성을 처리)
 애플리케이션 메인 스레드
 - 앱이 시작될 때 기본적으로 실행되는 단일 스레드
 - 주요 역할 : UI 레이아웃 렌더링, 이벤트 처리 및 사용자 인터페이스에서 부와 사용자 상호작용 측면에서 사용자 인터페이스를 처리
 
 애플리케이션 메인 스레드
 - 앱이 시작될 때 기본적으로 실행되는 단일 스레드
 - 주요 역할 : UI 레이아웃 렌더링, 이벤트 처리 및 사용자 인터페이스에서 부와 사용자 상호작용 측면에서 사용자 인터페이스를 처리 비동기 함수 정의화 호출 (async/await)
 - 함수 파라미터 뒤의 선언에 async 키워워드를 작성
 - 함수 또는 메서드가 값을 반환한다면 반환 화살표 (->) 전에 async 를 작성
 - 비동기 메서드를 호출할 때 해당 메서드가 반환될 때까지 실행이 일시 중단
 - 중단될 가능성이 있는 지점을 표시하기 위해 호출 앞에 await 를 작성
 - Task 를 이용하여 동기 함수에서 비동기 함수 호출
 */


import SwiftUI

struct ConcurrencyView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    
    // 동기 코드 p.232-233
    // takeTooLong() 함수가 실행되는 동안 아무 것도 할 수 없음
    /*func doSomething() {
     print("Start \(Date())")
     takeTooLong()
     print("End \(Date())")
     }
     
     func takeTooLong() {
     sleep(5)
     print("Async")
     }*/
    
    // 비동기 함수 호출 await
    func doSomething() async {
        print("Start \(Date())")
        async let result = takeTooLong()
        print("After async-let \(Date())")
        for i in 1...5 {print(i)}
        print("End \(await result)")
    }
    
    func takeTooLong() async -> Date {
        sleep(3)
        return Date()
    }
    
}

#Preview {
    ConcurrencyView()
}

