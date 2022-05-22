//
//  CurrentWeatherViewModel.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import Combine
import SwiftUI
import CoreLocation

class CurrentWeatherViewModel: ObservableObject, CurrentWeatherService, CurrentWeatherRealmService {
    
    var apiSession: APIService
    var crudManager: PersistenceProtocol
    @Published var weather: WeatherModel?
    @Published var dailyForecast: DailyForecast?
    @Published var isCelcius: Bool = true
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession(), crudManager: PersistenceProtocol = PersistenceManager()) {
        self.apiSession = apiSession
        self.crudManager = crudManager
    }
    
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        if let data = self.getLocalWeatherData() {
            self.weather = data
            print("Halllaaa \(data.main?.feelsLike)")
        }
        
        let cancellable = self.getCurrentWeather(latitude: latitude, longitude: longitude)
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { weather in
                self.weather = weather
                self.addLocalWeatherData(weather: weather)
            }
        cancellables.insert(cancellable)
    }
    
    func getDailyForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let cancellable = self.getDailyForecast(latitude: latitude, longitude: longitude)
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { dailyForecast in
                self.dailyForecast = dailyForecast
            }
        
        cancellables.insert(cancellable)
    }
}
