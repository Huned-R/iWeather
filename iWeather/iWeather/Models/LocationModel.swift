//
//  LocationModel.swift
//  iWeather
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import RealmSwift

class LocationModel: Object {
    @objc dynamic var lat: String = ""
    @objc dynamic var long: String = ""

    required init() {}
    
    convenience init(lat: String, long: String) {
        self.init()
        self.lat = lat
        self.long = long
    }
}
