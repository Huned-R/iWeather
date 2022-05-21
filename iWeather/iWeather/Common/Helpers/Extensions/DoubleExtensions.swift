//
//  DoubleExtensions.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

extension Double {
    func toRoundedString() -> String {
        return String(format: "%.0f", self)
    }
}
