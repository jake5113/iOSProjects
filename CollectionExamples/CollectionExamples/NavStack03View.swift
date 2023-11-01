//
//  NavStack03View.swift
//  CollectionExamples
//
//  Created by 이종원 on 11/1/23.
//

import SwiftUI

struct NavStack03View: View {
    var body: some View {
        NavigationStack {
            Text("")
                .navigationTitle("First View")
                .navigationBarItems(trailing:NavigationLink(
                    destination: NavStack03SecondView()
                        .navigationBarBackButtonHidden(),
                    label: {
                        Image(systemName: "person")
                        .foregroundStyle(.red)})
                )
        }
    }
}

struct NavStack03SecondView: View {
    var body: some View {
        ZStack{
            Color(.blue).ignoresSafeArea()
            Text("Hello")
        }
    }
}


#Preview {
    NavStack03View()
}
