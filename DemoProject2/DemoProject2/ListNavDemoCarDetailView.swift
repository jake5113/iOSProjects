//
//  CarDetailView.swift
//  DemoProject2
//
//  Created by 이종원 on 11/2/23.
//

import SwiftUI

// 상세 뷰 설계하기

struct CarDetailView: View {
    
    let selectedCar: Car
    
    var body: some View {
        Form{
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

#Preview {
    CarDetailView(selectedCar: carData[0])
}
