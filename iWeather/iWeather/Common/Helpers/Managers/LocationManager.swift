//
//  LocationManager.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var crudManager: PersistenceProtocol?
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    init(crudManager: PersistenceProtocol = PersistenceManager()) {
        super.init()
        manager.delegate = self
        self.crudManager = crudManager
        fetchLocalLocation()
    }
    
    func requesLocation() {
        isLoading = true
        fetchLocalLocation()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        addLocalLocation(locations: locations)
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error.localizedDescription)
        isLoading = false
    }
    
    private func fetchLocalLocation() {
        if let coordinates = crudManager?.fetchObjects(LocationModel.self)?.first as? LocationModel {
            let oldLocation = CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinates.lat) ?? 0, longitude: CLLocationDegrees(coordinates.long) ?? 0)
            self.location = oldLocation
            isLoading = false
        }
    }
    
    private func addLocalLocation(locations: [CLLocation]) {
        let location = LocationModel(lat: "\(locations.first?.coordinate.latitude ?? 0)", long: "\(locations.first?.coordinate.longitude ?? 0)")
        crudManager?.removeAllObjectsOfType(LocationModel.self)
        crudManager?.saveObject(location)
    }
}
