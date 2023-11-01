//
//  NavStack01SecondView.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct NavStack02View: View {
    
    @State var title: String = "First View"
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                NavigationLink(
                    destination: NavStack02SecondView(title: $title),
                    label: {
                        Image(systemName: "person")
                        .foregroundStyle(.red)})
            }
        }
    }
}

struct NavStack02SecondView: View {
    
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text(title)
            TextField("여기에 입력", text: $title)
        }
    }
}

#Preview {
    NavStack02View()
}
