//
//  ListNavigationView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/31/23.
//

import SwiftUI

// 동적 리스트
// - 리스트에 표시할 데이터는 Idendtifiable 프로토콜을 따라야 한다.
// - id 프로퍼티 필수 : 각 항목을 고유하게 식별하는데 사용
// - Hashable 프로토콜을 따르는 모든 스위프트 타입이나 커스텀 타입이 가능
// - UUID() 메서드는 각 항목마다 고유한 ID를 자동으로 생성하는데 사용
struct ToDoItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ListNavigationView: View {
    
    @State private var toggleStatue = true
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        // 가장 단순한 형태의 List 표현
        // 하나 이상 뷰의 각 행을 수직 방향의 목록으로 정보를 표현
        // 리스트 구분자 및 행 수정 p.300
        List {
            Text("Wash the car")
                .listRowSeparator(.hidden)
            Text("Vacuum house")
            Text("Pick up kids from school bus @ 3pm")
                .listRowSeparatorTint(.green)
            Text("Auction the kids on eBay")
                .listRowSeparatorTint(.red)
            Text("Order Pizza for dinner")
                .listRowBackground(Color.red)
        }
        
        NavigationStack {
            List(listData) { item in
                NavigationLink(value: item.task) {
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
        }
        
        NavigationLink(value: listData.count) {
            Text("View Task Count")
        }
        
        
        
        List {
            Section(header: Text("Setting")){
                Toggle(isOn: $toggleStatue) {
                    Text("Allow Notifications")
                }
            }
            
            Section(header: Text("TO DO TASKS")){
                ForEach(listData) { item in
                    NavigationLink(value: item.task) {
                        HStack {
                            Image(systemName: item.imageName)
                            Text(item.task)
                        }
                    }
                }
            }
        }
        .navigationDestination(for: String.self) { task in
            Text("Selected task = \(task)")
        }
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
            ]
        }
        
        
        
        // 리스트 셀은 여러 컴포넌트를 조합혀여 셀에 표시할 수 있다.
        /*List {
         HStack {
         Image(systemName: "trash.circle.fill")
         Text("Take out the trash")
         }
         
         HStack {
         Image(systemName: "person.2.fill")
         Text("Pick up the kids")
         }
         
         HStack {
         Image(systemName: "car.fill")
         Text("Wash the car")
         }
         }*/
    }
}

#Preview {
    ListNavigationView()
}
