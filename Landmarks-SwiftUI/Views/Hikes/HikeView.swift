//
//  HikeView.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 27/06/24.
//

import SwiftUI

struct HikeView: View {
    @State private var showDetail: Bool = false
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                
            VStack(alignment: .leading) {
                Text("Lonesome Ride Trail")
                    .font(.title2)
                Text("4.5 km")
                    .font(.subheadline)
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
        HikeView()
    }
}
