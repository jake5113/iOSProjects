//
//  ContentView.swift
//  SwiftApiDemo
//
//  Created by 이종원 on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = NewsAPI.shared
    
    var body: some View {
        List {
            ForEach(network.posts, id: \.self) { result in
                HStack {
                    AsyncImage(url: URL(string: result.urlToImage ?? "")) { image in
                        image.image?.resizable()
                    }
                        .frame(width: 120, height: 80)
                    Text(result.title)
                        .bold()
                }
            }
        }
        .onAppear() {
            network.fetchData()
        }
    }
}

struct Results: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Hashable {
    let title: String
    let url: String
    let urlToImage: String?
}

class NewsAPI: ObservableObject {
    static let shared = NewsAPI()
    private init() {  }
    @Published var posts = [Article]()
    
    private var apiKey: String? {
        get {
            let keyfilename = "ApiKeys"
            let api_key = "API_KEY"
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyfilename, ofType: "plist") else { fatalError("Cannot find '\(keyfilename).plist' file")
            }
            
            // .plist 파일 내용을 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 키 찾기
            guard let value = plist?.object(forKey: api_key) as? String else {
                fatalError("Cannot find key '\(api_key)'")
            }
            
            return value
        }
    }
    
    func fetchData() {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://newsapi.org/v2/everything?q=Apple&from=2023-11-29&sortBy=popularity&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        // dataTask() 메서드의 with: 매개변수에 url 또는 request 객체를 가지고 통신
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Results.self, from: data)
                print(json.articles.count)
                DispatchQueue.main.async {
                    self.posts = json.articles
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

#Preview {
    ContentView()
}
