//
//  CurrentWeatherViewModeltests.swift
//  iWeatherTests
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import XCTest
import Combine
import CoreLocation

class CurrentViewModelTests: XCTestCase {
    
    var viewModel: CurrentWeatherViewModel!
    
    override func setUp() {
        self.viewModel = CurrentWeatherViewModel(apiSession: MockApiSession(dummyStringResponse: dummyWeatherDataString), crudManager: MockPersistanceService())
    }
    
    override func tearDown() {
        self.viewModel = nil
    }
    
    func testIfOnCorrectDataFetchValuesShoulUpdate() {
        viewModel.getCurrentWeather(latitude: CLLocationDegrees(0), longitude: CLLocationDegrees(0))
        XCTAssert(viewModel.weather != nil)
        XCTAssert(viewModel.weather?.name == "New York")
    }
}
