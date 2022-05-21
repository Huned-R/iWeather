//
//  APIError.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
