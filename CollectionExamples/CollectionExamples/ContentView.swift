//
//  ContentView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/12/23.
//

import SwiftUI

struct ViewList : Identifiable {
    var id = UUID()
    var viewName: String
    var view: any View
}

struct ContentView: View {
    
    @State var viewList: [ViewList] = [
        ViewList(viewName: "Ex09OddEvenView", view: Ex09OddEvenView()),
        ViewList(viewName: "Ex10BigMinSmallView", view: Ex10BigMinSmallView()),
        ViewList(viewName: "Ex11BasketBallView", view: Ex11BasketBallView())
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewList) { item in
                    NavigationLink(value: item.viewName) {
                        HStack {
                            Text(item.viewName)
                        }
                    }
                }
            }
            
            
            
            NavigationStack{
                NavigationLink(destination: Ex09OddEvenView()) {
                    Text("Ex09OddEvenView")
                }
                NavigationLink(destination: Ex10BigMinSmallView()) {
                    Text("Ex10BigMinSmallView")
                }
                NavigationLink(destination: Ex11BasketBallView()) {
                    Text("Ex11BasketBallView")
                }
                NavigationLink(destination: Ch23View()) {
                    Text("Ch23View - SwiftUI 예제 튜토리얼")
                }
                NavigationLink(destination: UIEx01View()) {
                    Text("UIEx01View")
                }
                NavigationLink(destination: UIEx02View()) {
                    Text("UIEx02View")
                }
                NavigationLink(destination: ConcurrencyEx01View()) {
                    Text("ConcurrencyEx01View")
                }
                NavigationLink(destination: ConcurrencyEx02View()) {
                    Text("ConcurrencyEx02View")
                }
                NavigationLink(destination: UIEx04View()) {
                    Text("UIEx04View")
                }
                NavigationLink(destination: UIEx05View()) {
                    Text("UIEx05View")
                }
                NavigationLink(destination: AlignmentZStackView()) {
                    Text("AlignmentZStackView")
                }
                NavigationLink(destination: StackAlignEx01View()) {
                    Text("StackAlignEx01View")
                }
                NavigationLink(destination: SceneAppStorageNavView()) {
                    Text("SceneAppStorageNavView")
                }
                NavigationLink(destination: ListEx01View()) {
                    Text("ListEx01View")
                }
            }
        }
    }
}

#Preview {
        ContentView()
    }

