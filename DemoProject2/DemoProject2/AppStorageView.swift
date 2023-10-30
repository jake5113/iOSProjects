//
//  AppStorageView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct UserName: Encodable, Decodable {
    var firstName: String
    var secondName: String
}

struct AppStorageView: View {
    
    @AppStorage("mytext") var editorText: String = "Sample Text"
    @AppStorage("username") var namestore: Data = Data()
    
    @State var username = UserName(firstName: "jake", secondName: "lee")

    
    var body: some View {
        VStack {
            HStack {
                TextField("firstname", text: $username.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear() {
                        let decoder = JSONDecoder()
                        
                        if let name = try? decoder.decode(UserName.self, from: namestore) {
                            username = name
                        }
                    }
                
                TextField("secondname", text: $username.secondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("username save") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(username) {
                    namestore = data
                    editorText = data.base64EncodedString()
                }
            }
            
            TextEditor(text: $editorText)
                .padding(30)
                .font(.largeTitle)
        }
        .background(Color.gray)
    }
}

#Preview {
    AppStorageView()
}
