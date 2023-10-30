//
//  ContentView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink(destination: Ex09OddEvenView()) {
                Text("Ex09OddEvenView")
                    .padding()
            }
            NavigationLink(destination: Ex10BigMinSmallView()) {
                Text("Ex10OddEvenView")
                    .padding()
            }
            NavigationLink(destination: Ex11BasketBallView()) {
                Text("Ex11BasketBallView")
                    .padding()
            }
            NavigationLink(destination: Ch23View()) {
                Text("Ch23View - SwiftUI 예제 튜토리얼")
                    .padding()
            }
            NavigationLink(destination: UIEx01View()) {
                Text("UIEx01View")
                    .padding()
            }
            NavigationLink(destination: UIEx02View()) {
                Text("UIEx02View")
                    .padding()
            }
            NavigationLink(destination: ConcurrencyEx01View()) {
                Text("ConcurrencyEx01View")
                    .padding()
            }
            NavigationLink(destination: ConcurrencyEx02View()) {
                Text("ConcurrencyEx02View")
                    .padding()
            }
            NavigationLink(destination: UIEx04View()) {
                Text("UIEx04View")
                    .padding()
            }
            NavigationLink(destination: UIEx05View()) {
                Text("UIEx05View")
                    .padding()
            }
            NavigationLink(destination: AlignmentZStackView()) {
                Text("AlignmentZStackView")
                    .padding()
            }
            NavigationLink(destination: StackAlignEx01View()) {
                Text("StackAlignEx01View")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
