//
//  DailyWeatherModel.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import RealmSwift

// MARK: - DailyForecast
class DailyForecast: Object, Codable {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lon: Double = 0
    @objc dynamic var timezone: String = ""
    @objc dynamic var timezoneOffset: Int = 0
    @objc dynamic var current: Current?
    var daily = List<Daily>()
}

// MARK: - Current
class Current: Object,  Codable {
    @objc dynamic var dt: Int = 0
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var dewPoint: Double = 0
    @objc dynamic var uvi: Double = 0
    @objc dynamic var clouds: Int = 0
    @objc dynamic var visibility: Int = 0
    @objc dynamic var windSpeed: Double = 0
    @objc dynamic var windDeg: Int = 0
    var weather = List<Weather>()
}

// MARK: - Weather
class Weather: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String = ""
    @objc dynamic var icon: String = ""
}

// MARK: - Daily
class Daily: Object, Codable {
    @objc dynamic var dt: Int = 0
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    @objc dynamic var moonrise: Int = 0
    @objc dynamic var moonset: Int = 0
    @objc dynamic var moonPhase: Double = 0
    @objc dynamic var temp: Temp?
    @objc dynamic var feelsLike: FeelsLike?
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var dewPoint: Double = 0
    @objc dynamic var windSpeed: Double = 0
    @objc dynamic var windDeg: Int = 0
    @objc dynamic var windGust: Double = 0
    var weather = List<Weather>()
    @objc dynamic var clouds: Int = 0
    @objc dynamic var pop: Int = 0
    @objc dynamic var uvi: Double = 0
}

extension Daily: Identifiable {
    var id: UUID { return UUID() }
}

// MARK: - FeelsLike
class FeelsLike: Object, Codable {
    @objc dynamic var day: Double = 0
    @objc dynamic var night: Double = 0
    @objc dynamic var eve: Double = 0
    @objc dynamic var morn: Double = 0
}

// MARK: - Temp
class Temp: Object, Codable {
    @objc dynamic var day: Double = 0
    @objc dynamic var min: Double = 0
    @objc dynamic var max: Double = 0
    @objc dynamic var night: Double = 0
    @objc dynamic var eve: Double = 0
    @objc dynamic var morn: Double = 0
}
