//
//  mockRealmService.swift
//  iWeatherTests
//
//  Created by Huned on 22/05/2022.
//

import Foundation
import RealmSwift

class MockPersistanceService: PersistenceProtocol {
    var instance: Realm
    
    init() {
        instance = try! Realm()
    }
    
    func saveObjects<T>(_ objects: [T]) where T : Object {}
    
    func saveObject<T>(_ object: T) where T : Object {}
    
    func fetchObjects(_ type: Object.Type) -> [Object]? {
        return nil
    }
    
    func fetchObjects<T>(_ type: T.Type, predicate: NSPredicate) -> [T]? where T : Object {
        return nil
    }
    
    func updateObjects<T>(_ objects: [T]) throws where T : Object {}
    
    func updateObject<T>(_ object: T) throws where T : Object {}
    
    func removeObjects<T>(_ objects: [T]) where T : Object {}
    
    func removeObject<T>(_ object: T) where T : Object {}
    
    func removeAllObjectsOfType<T>(_ type: T.Type) where T : Object {}
    
    func removeAll() {}
}
