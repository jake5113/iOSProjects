//
//  ListNavDemoView.swift
//  DemoProject2
//
//  Created by 이종원 on 11/2/23.
//
/*
 프로젝트 개요
 
 프로젝트 준비
 - 데이터 준비 : 차량 이미지 에셋파일 프로젝트에 포함.
 - 에셋에 포함되어 있는 차량 이미지와 스펙 항목이 포함되어 있는 carData.json 파일을 프로젝트에 포함.
 - 자동차 모델을 나타내는 Car 구조체 선언
    - Identifiable 프로토콜을 따르도록 선언되어 각 인스턴스는 List 뷰에서 식별가능
 */

import SwiftUI

// -------------책에서는 파일을 나눠서 관리함.----------------
struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}

// JSON 데이터 로딩
var carData: [Car] = loadJson("carData.json")

// 데이터 저장소 구조체를 추가
class CarStore: ObservableObject {
    @Published var cars: [Car]
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
// -----------------------------------------------------

struct ListNavDemoView: View {
    
    @StateObject var carStore: CarStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(car: carStore.cars[i])
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                CarDetailView(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)
            }
            .navigationTitle("EV Cars")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}



#Preview {
    ListNavDemoView()
}
