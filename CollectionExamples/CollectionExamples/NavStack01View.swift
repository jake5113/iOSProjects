//
//  NavStack01View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct NavStack01View: View {
    
    @State var title: String = "First View"
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                NavigationLink(
                    destination: NavStack01SecondView(title: $title),
                    label: {
                        Image(systemName: "person")
                        .foregroundStyle(.red)})
            }
        }
    }
}

struct NavStack01SecondView: View {
    
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text(title)
        }
        .onAppear {
            title = "Second View"
        }
        .onDisappear {
            title = "First View"
        }
    }
}

#Preview {
    NavStack01View()
}
