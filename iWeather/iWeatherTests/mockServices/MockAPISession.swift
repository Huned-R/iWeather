//
//  MockAPIService.swift
//  iWeatherTests
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import Combine

class MockApiSession: APIService {
    
    var dummyJSONFile: String
    
    init(dummyJson: String) {
        self.dummyJSONFile = dummyJson
    }
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {
        
        let data: Data

        guard let file = Bundle.main.url(forResource: dummyJSONFile, withExtension: nil)
            else {
                fatalError("Couldn't find \(dummyJSONFile) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(dummyJSONFile) from main bundle:\n\(error)")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError {error in
                    .decodingError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
