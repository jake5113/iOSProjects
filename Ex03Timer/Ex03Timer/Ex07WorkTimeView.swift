//
//  Ex07WorkTimeView.swift
//  Ex03Timer
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct Ex07WorkTimeView: View {
    @State private var workTime: String = ""
    
    var body: some View {
        TextField("근무한 시간", text: $workTime)
            .overlay(RoundedRectangle(cornerRadius: 3)
                .stroke(Color.teal))
            .padding(30)
        Text("총 급여는 \(workTime)원 입니다.")
        Button(action: {}, label: {
        })
    }
    
}

#Preview {
    Ex07WorkTimeView()
}
