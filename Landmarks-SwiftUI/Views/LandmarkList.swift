//
//  LandmarkList.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 31/05/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmrak in
            LandmarkRow(landmark: landmrak)
        }
    }
}

/*
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
*/