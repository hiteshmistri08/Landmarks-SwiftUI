//
//  MapView.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 30/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
//    var coordinate: CLLocationCoordinate2D
    var region: MKCoordinateRegion {
        didSet {
            regionWithZoom = MKCoordinateRegion(center: region.center, latitudinalMeters: delta, longitudinalMeters: delta)
        }
    }
    
    @State var regionWithZoom: MKCoordinateRegion = MKCoordinateRegion(center: .init(latitude: 0.1, longitude: 1.2), latitudinalMeters: 0.2, longitudinalMeters: 0.2)
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near:
            return 0.02
        case .medium:
            return 0.2
        case .far:
            return 2
        }
    }
    
    var body: some View {
        Map(coordinateRegion: $regionWithZoom)
    }
    
    
    /*
    @State private var region: MKCoordinateRegion = {
        MKCoordinateRegion(
            center: $coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }()
    */
}

/*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    }
}
*/
