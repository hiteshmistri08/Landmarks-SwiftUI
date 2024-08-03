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
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationSplitView {
                List {
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
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            Toggle(isOn: $showFavoritesOnly) {
                                Text("Favorites only")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
            } detail: {
                Text("Select a landmark")
            }
        } else {
            // Fallback on earlier versions
            NavigationView {
                List {
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
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            Toggle(isOn: $showFavoritesOnly) {
                                Text("Favorites only")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
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
