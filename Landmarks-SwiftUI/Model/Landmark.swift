//
//  Landmark.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 31/05/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D.init(latitude: coordinates.lattitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var lattitude: Double
        var longitude: Double
    }
}
