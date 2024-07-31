//
//  LandmarkList.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 31/05/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject private var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ !showFavoritesOnly || $0.isFavorite }
    }
    
    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationSplitView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    
                    ForEach(filteredLandmarks) { landmrak in
                        NavigationLink {
                            LandmarkDetail(landmark: landmrak)
                                .environmentObject(modelData)
                        } label: {
                            LandmarkRow(landmark: landmrak)
                        }
                    }
                }
                .animation(.default, value: filteredLandmarks)
                .navigationTitle("Landmarks")
                .frame(minWidth: 300)
            } detail: {
                Text("Select a landmark")
            }
        } else {
            // Fallback on earlier versions
            NavigationView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    
                    ForEach(filteredLandmarks) { landmrak in
                        NavigationLink {
                            LandmarkDetail(landmark: landmrak)
                                .environmentObject(modelData)
                        } label: {
                            LandmarkRow(landmark: landmrak)
                        }
                    }
                }
                .animation(.default, value: filteredLandmarks)
                .navigationTitle("Landmarks")
                .frame(minWidth: 300)
            }
        }
    }
}

/*
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
*/
