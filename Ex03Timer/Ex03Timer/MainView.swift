//
//  ExListView.swift
//  Ex03Timer
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct ExListView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: Ex06SecToHMSView(), label: {
                    Text("Ex06 SecToHMS")
                })
                NavigationLink(destination: Ex07WorkTimeView(), label: {
                    Text("Ex07 WorkTime")
                })
            }
        }
    }
}

#Preview {
    ExListView()
}
