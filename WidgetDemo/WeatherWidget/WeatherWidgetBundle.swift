//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by 이종원 on 12/28/23.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetLiveActivity()
    }
}
