//
//  CurrentWeatherEndpoint.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import CoreLocation

enum CurrentWeatherEndpoint {
    case currentWeather(CLLocationDegrees, CLLocationDegrees)
}

extension CurrentWeatherEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        
        var url: String = ""
        
        switch self {
        case .currentWeather(let latitude, let longitude):
            url =  baseURL + "weather?lat=\(latitude)&lon=\(longitude)&units=metric"
        }
        
        url += "&appid=\(apiKey)"
        guard let url = URL(string: url) else {
            preconditionFailure("Invalid URL format")
        }
        
        return URLRequest(url: url)
    }
}
