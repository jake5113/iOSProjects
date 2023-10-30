//
//  UIEx04View.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

extension Image {
    func oneyoungImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 110)
            .clipShape(Circle())
    }
}

struct imgOneyoung: View {
    var body: some View {
        Image("oneyoung")
            .oneyoungImageModifier()
    }
}

struct btn: View {
    var body: some View {
        Button("Button"){
            
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

struct UIEx04View: View {
    var body: some View {
        VStack() {
            Image("oneyoung")
                .oneyoungImageModifier()
            HStack {
                imgOneyoung()
                imgOneyoung()
                imgOneyoung()
            }
            HStack {
                imgOneyoung()
                imgOneyoung()
                imgOneyoung()
            }
            Spacer()
            HStack {
                btn()
                Spacer()
                btn()
                Spacer()
                btn()
            }
        }
    }
}

#Preview {
    UIEx04View()
}
