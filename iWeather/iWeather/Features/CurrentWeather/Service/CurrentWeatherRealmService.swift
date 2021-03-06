//
//  RealmService.swift
//  iWeather
//
//  Created by Huned on 22/05/2022.
//

import Foundation

protocol CurrentWeatherRealmService {
    var crudManager: PersistenceProtocol {get}
    func getLocalWeatherData() -> WeatherModel?
    func addLocalWeatherData(weather: WeatherModel)
    func getLocalDailyForecasts() -> DailyForecast?
    func addLocalDailyForecasts(dailyForecast: DailyForecast)
}

extension CurrentWeatherRealmService {
    
    func getLocalWeatherData() -> WeatherModel? {
        return crudManager.fetchObjects(WeatherModel.self)?.first as? WeatherModel
    }
    
    func addLocalWeatherData(weather: WeatherModel) {
        crudManager.removeAllObjectsOfType(WeatherModel.self)
        crudManager.saveObject(weather)
    }
    
    func getLocalDailyForecasts() -> DailyForecast? {
        return (crudManager.fetchObjects(DailyForecast.self)?.first) as? DailyForecast
    }
    
    func addLocalDailyForecasts(dailyForecast: DailyForecast) {
        crudManager.removeAllObjectsOfType(DailyForecast.self)
        crudManager.saveObject(dailyForecast)
    }
}
