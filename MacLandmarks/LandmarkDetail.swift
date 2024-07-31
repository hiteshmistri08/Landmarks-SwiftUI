//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Hitesh on 31/07/24.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject private var model: ModelData
    
    var landmark: Landmark
    
    private var landmarkIndex: Int {
        model.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(region: landmark.coordinateRegion)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }

            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $model.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let model = ModelData()
        LandmarkDetail(landmark: model.landmarks[0])
            .environmentObject(model)
            .frame(width: 850, height: 700)

    }
}
