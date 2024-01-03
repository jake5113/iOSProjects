//
//  ContentView.swift
//  ChartDemo
//
//  Created by 이종원 on 12/22/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack {
            BasicAreaChartView()
            DataAreaChartView()
        }
        .padding()
        .frame(height: 200)
    }
}

struct BasicAreaChartView: View {
    var body: some View {
        Chart {
            AreaMark(
                x: PlottableValue.value("Month", "Jan"),
                y: PlottableValue.value("Temp", 50)
            )
            AreaMark(
                x: .value("Month", "Feb"),
                y: .value("Temp", 43)
            )
            AreaMark(
                x: .value("Month", "Mar"),
                y: .value("Temp", 61)
            )
        }
    }
}

struct MonthlyTemp: Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
}

let tempData: [MonthlyTemp] = [
    MonthlyTemp(month: "Jan", degrees: 50),
    MonthlyTemp(month: "Feb", degrees: 43),
    MonthlyTemp(month: "Mar", degrees: 61)
]

struct DataAreaChartView: View {
    var body: some View {
        Chart(tempData) { data in
            AreaMark(x: .value("Month", data.month),
                     y: .value("Temp", data.degrees)
            )
        }
        
        Chart {
            ForEach(tempData) { data in
                AreaMark(x: .value("Month", data.month),
                         y: .value("Temp", data.degrees)
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
