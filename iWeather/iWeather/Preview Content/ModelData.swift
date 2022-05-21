//
//  ModelData.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

var previewWeather: WeatherModel = load("WeatherData.json")
var previewDailyForecast: DailyForecast = load("WeatherForecast.json")
var previewDaily: Daily = load("DailyData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
