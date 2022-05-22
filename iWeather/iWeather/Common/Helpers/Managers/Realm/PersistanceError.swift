//
//  PersistanceError.swift
//  iWeather
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import RealmSwift

struct PersistenceError: Error {
    
    enum ErorsCodes: Int {
        case objectMissing = 0
        
        func getDescription() -> String {
            switch self {
            case .objectMissing:
                return "Realm object is missing"
            }
        }
    }
    
    var code: Int
    var description: String
}
