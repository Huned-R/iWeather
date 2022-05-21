//
//  APILayer.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
