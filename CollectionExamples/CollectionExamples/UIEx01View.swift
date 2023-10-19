//
//  UIEx01View.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/16/23.
//

import SwiftUI

struct UIEx01View: View {
    @State private var inputText: String = ""
    var body: some View {
        VStack {
            VStack(alignment: HorizontalAlignment.leading) {
                Image("LESSERAFIM")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
                    .padding()
            
                
                HStack {
                    Button (action: {}, label: {
                        Text("HOME")
                    })
                    .buttonStyle(.borderedProminent)
                    .frame(alignment: .leading)
                    
                    Spacer()
                    
                    Text(inputText)
                    
                    Spacer()
                    
                    Button ("CALL") {
                        let number = "01056895113"
                        let telephone = "tel://"
                        let formattedString = telephone + number
                        guard let url = URL(string: formattedString) else {
                            return
                        }
                        UIApplication.shared.open(url)
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(alignment: .bottom)
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            HStack(alignment: .bottom) {
                TextField("Hello, World!", text: $inputText)
                
                Button (action: {}, label: {
                    Text("BUTTON!")
                })
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .frame(alignment: .bottom)
        }
        .background(.purple)
    }
}

#Preview {
    UIEx01View()
}
