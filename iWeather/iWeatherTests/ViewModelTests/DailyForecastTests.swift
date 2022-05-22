//
//  DailyForecastTests.swift
//  iWeather
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import XCTest

class DailyForecastsTest: XCTestCase {
    
    var viewModel: CurrentWeatherViewModel!
    
    override func setUp() {
        self.viewModel = CurrentWeatherViewModel(apiSession: MockApiSession(dummyWeatherForecastString), crudManager: MockPersistanceService())
    }
    
    override func tearDown() {
        self.viewModel = nil
    }
}
