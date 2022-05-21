//
//  APIError.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

enum APIError: Error {
    case decodingError(String)
    case httpError(Int)
    case unknown
}
