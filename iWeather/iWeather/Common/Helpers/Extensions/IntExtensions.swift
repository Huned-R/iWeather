//
//  IntExtensions.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

extension Int {
    
    func toDate() -> Date {
        return Date(timeIntervalSince1970: Double(self))
    }
}
