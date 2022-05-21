//
//  WeatherModel.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

// Model of the response body we get from calling the OpenWeather API
struct WeatherModel: Codable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Codable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Codable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Codable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Codable {
        var speed: Double
        var deg: Double
    }
}

//extension WeatherModel.MainResponse {
//    var feelsLike: Double { return feels_like }
//    var tempMin: Double { return temp_min }
//    var tempMax: Double { return temp_max }
//}
