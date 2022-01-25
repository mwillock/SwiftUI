//
//  LocationModel.swift
//  African Animals
//
//  Created by Myron on 12/7/21.
//

import SwiftUI
import MapKit

struct NationalParkLoction: Codable, Identifiable{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    //Computed Property
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
