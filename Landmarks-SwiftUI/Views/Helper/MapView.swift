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
    @State var region: MKCoordinateRegion
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            self
        }
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
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

///*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    }
}
//*/
