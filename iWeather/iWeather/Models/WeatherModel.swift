//
//  WeatherModel.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import RealmSwift

// MARK: - Weather Model
// Model of the response body we get from calling the OpenWeather API
class WeatherModel: Object, Codable {
    @objc dynamic var coord: CoordinatesResponse?
    var weather = List<WeatherResponse>()
    @objc dynamic var main: MainResponse?
    @objc dynamic var name: String = ""
    @objc dynamic var wind: WindResponse?
}

class CoordinatesResponse: Object, Codable {
    @objc dynamic var lon: Double = 0
    @objc dynamic var lat: Double = 0
}

class WeatherResponse: Object, Codable{
    @objc dynamic var id: Double = 0
    @objc dynamic var main: String = ""
    @objc dynamic var icon: String = ""
}

class MainResponse: Object, Codable {
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var tempMin: Double = 0
    @objc dynamic var tempMax: Double = 0
    @objc dynamic var pressure: Double = 0
    @objc dynamic var humidity: Double = 0
}

class WindResponse: Object, Codable {
    @objc dynamic var speed: Double = 0
    @objc dynamic var deg: Double = 0
}
