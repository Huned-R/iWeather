//
//  CURDOperations.swift
//  iWeather
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import RealmSwift

protocol CRUDOperations {
    func getData<T: Object>() -> T?
    //func getMultipleData<T: Object>() -> [T]?
    func deleteAllData<T: Object>(on: T.Type)
    func addData<T: Object>(data: T)
}
