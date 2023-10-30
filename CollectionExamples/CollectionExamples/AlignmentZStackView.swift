//
//  AlignmentZStackView.swift
//  CollectionExamples
//
//  Created by 이종원 on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension Alignment {
    static let myAlignment = Alignment(
        horizontal: .myAlignment,
        vertical: .crossAlignment)
}

struct AlignmentZStackView: View {
    var body: some View {
//        HStack(alignment: .crossAlignment, spacing: 20) {
//            Circle()
//                .foregroundColor(.purple)
//                .frame(width: 100)
//                .alignmentGuide(.crossAlignment, computeValue: { dimension in
//                    dimension[VerticalAlignment.center]
//                })
//            VStack {
//                Rectangle()
//                    .foregroundColor(.green)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundColor(.red)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundColor(.blue)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundColor(.orange)
//                    .frame(width: 100, height: 100)
//            }
//        }
//        .padding()
        ZStack(alignment: Alignment.myAlignment) {
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(HorizontalAlignment.myAlignment) { dimension in
                    dimension[.trailing]
                }
                .alignmentGuide(VerticalAlignment.crossAlignment) { dimension in
                    dimension[.bottom]
                }
            Rectangle()
            Circle()
        }
    }
}

#Preview {
    AlignmentZStackView()
}
