//
//  UIEx05View.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

struct UIEx05View: View {
    
    @State private var icup = "square.and.arrow.up"
    @State private var icdown = "square.and.arrow.down"
    
    var body: some View {
        VStack {
            Image(systemName: icup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Spacer()
            
            HStack {
                Button("UP") {
                    if icup.hasSuffix("down") {
                        (icup, icdown) = (icdown, icup)
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("DOWN") {
                    if icup.hasSuffix("up") {
                        (icup, icdown) = (icdown, icup)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
            Image(systemName: icdown)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
        }
    }
}

#Preview {
    UIEx05View()
}
