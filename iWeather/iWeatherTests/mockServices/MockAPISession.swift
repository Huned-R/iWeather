//
//  MockAPIService.swift
//  iWeatherTests
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import Combine

class MockApiSession: APIService {
    
var dummyStringResponse: String
    init(_ dummyStringResponse: String) {
        self.dummyStringResponse = dummyStringResponse
    }
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {

        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let data = dummyStringResponse.data(using: .utf8)!
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError {error in
                    .decodingError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
