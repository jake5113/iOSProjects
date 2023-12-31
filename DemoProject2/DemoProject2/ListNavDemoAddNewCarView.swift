//
//  ListNavDemoAddNewCarView.swift
//  DemoProject2
//
//  Created by 이종원 on 11/2/23.
//

import SwiftUI

struct AddNewCar: View {
    
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: description,
                         isHybrid: isHybrid,
                         imageName: "tesla_model_3")
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

// 액세스 할 수 없는 탐색 뷰를 전달할 것으로 예상되므로 주석 처리
//#Preview {
//    AddNewCar(carStore: CarStore(cars: carData))
//}
