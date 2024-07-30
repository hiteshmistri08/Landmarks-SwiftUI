//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Hitesh on 30/07/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject private var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            CircleImage(image: landmark.image.resizable())
                .scaledToFill()
            
            Text(landmark.name)
                .font(.headline)
                .lineLimit(0)
            
            Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                Text("Favorite")
            }
            
            Divider()
            
            Text(landmark.park)
                .font(.caption)
                .bold()
                .lineLimit(0)
            
            Text(landmark.state)
                .font(.caption)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
