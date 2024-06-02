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

/*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
*/
