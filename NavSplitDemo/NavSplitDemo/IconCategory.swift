//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by 이종원 on 11/8/23.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}
