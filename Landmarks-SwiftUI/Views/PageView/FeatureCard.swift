//
//  FeatureCard.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 28/07/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

