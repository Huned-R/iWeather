//
//  RequestBuilder.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
