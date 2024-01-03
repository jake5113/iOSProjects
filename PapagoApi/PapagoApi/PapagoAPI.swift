//
//  File.swift
//  PapagoApi
//
//  Created by 이종원 on 12/1/23.
//

import SwiftUI

struct TranslateResults: Decodable {
    let message: Message
}

struct Message: Decodable {
    let type: String
    let service: String
    let version: String
    let result: Result
    
    enum CodingKeys: String, CodingKey {
        case result
        case type = "@type"
        case service = "@service"
        case version = "@version"
    }
}

struct Result: Decodable {
    let translatedText: String
}

class PapagoAPI: ObservableObject {
    static let shared = PapagoAPI()
    private init() { }
    
    private var clientID: String? {
        get { getValueOfPlistFile("ApiKeys", "PAPAGO_CLIENT_ID") }
    }
    
    private var clientSecret: String? {
        get { getValueOfPlistFile("ApiKeys", "PAPAGO_CLIENT_SECRET") }
    }
    
    
    func feachData() {
        guard let clientID = clientID else { return }
        guard let clientSecret = clientSecret else { return }
        
        let urlString = "https://openapi.naver.com/v1/papago/n2mt"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let sourceString = "안녕"
        let strWithParameters = "source=ko&target=en&text=\(sourceString)"
        let data = strWithParameters.data(using: .utf8)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = data
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            
        }
        task.resume()
    }
}
