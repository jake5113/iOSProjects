//
//  ContentView.swift
//  UIUX
//
//  Created by 이종원 on 10/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mandarin: Int = 0
    @State private var limit: Int = 0
    
    @State private var box: Int = 0
    @State private var remainder: Int = 0
    
    //UI
    let title = "귤을 박스에 나누어 담는 계산기"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .frame(minWidth: 350, alignment: .leading)
            Group {
                Label("귤의 총 개수", systemImage: "")
                    .frame(minWidth: 370, alignment: .leading)
                TextField("귤 개수", value: $mandarin, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 40)
                
                Label("귤의 총 개수", systemImage: "")
                    .frame(minWidth: 370, alignment: .leading)
                TextField("박스 용량", value: $limit, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 40)
                
            }.padding(.horizontal, 20)
            
            Text("박스수는 \(box)개 입니다")
                .frame(minWidth: 370, alignment: .leading)
                .font(.title)
            Text("남은 귤 수는 \(remainder)개 입니다")
                .padding(.bottom, 40)
                .font(.title)
                .frame(minWidth: 370, alignment: .leading)
            HStack {
                Button(action: {
                    box = mandarin / limit
                    remainder = mandarin % limit
                }, label: {
                    Text("귤 수 계산")
                })
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }.padding(.leading, 20)
        }
    }
}

#Preview {
    ContentView()
}
