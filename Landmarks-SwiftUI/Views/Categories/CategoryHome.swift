//
//  CategoryHome.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 15/07/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.landmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
