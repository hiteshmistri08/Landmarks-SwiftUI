//
//  HikeView.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 27/06/24.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail: Bool = false
    
    var body: some View {
        HStack {
            HikeGraph(hike: hike, path: \.elevation)
                .frame(width: 50, height: 30)

            VStack(alignment: .leading) {
                Text(hike.name)
                    .font(.headline)
                Text(hike.distanceText)
            }
            
            Spacer()
            
            Button {
                showDetail.toggle()
            } label: {
                Label("Graph", systemImage: "chevron.right.circle")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
                    .rotationEffect(.degrees( showDetail ? 90 : 0))
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
