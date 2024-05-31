//
//  LandmarkRow.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 31/05/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text("Hello, World!")
            
            Spacer()
        }
        .padding()
    }
}
/*
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark:  landmarks[0])
    }
}
*/
