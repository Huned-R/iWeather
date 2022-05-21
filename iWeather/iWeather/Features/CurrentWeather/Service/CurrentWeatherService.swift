//
//  CurrentWeatherService.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import Combine
import CoreLocation

protocol CurrentWeatherService {
    var apiSession: APIService {get}
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> AnyPublisher<WeatherModel, APIError>
}

extension CurrentWeatherService {
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> AnyPublisher<WeatherModel, APIError> {
        return apiSession.request(with: CurrentWeatherEndpoint.currentWeather(latitude, longitude))
            .eraseToAnyPublisher()
    }
}
