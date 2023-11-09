//
//  GridRowView.swift
//  DemoProject2
//
//  Created by 이종원 on 11/9/23.
//

import SwiftUI

struct CellContent: View {
    var index: Int
    var color: Color
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

struct GridRowView: View {
    
    var body: some View {
        Grid {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if (index % 2 == 1) {
                        CellContent(index: index, color: .red)
                    } else {
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            
            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            
            CellContent(index: 16, color: .blue)
        }
    }
}

#Preview {
    GridRowView()
}
