//
//  GraphCapsule.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 28/06/24.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    
    var body: some View {
        Capsule()
            .fill(.red)
            .frame(width: 20, height: 80)
    }
}


func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(
            index: 0,
            color: .blue,
            height: 150,
            range: 10..<50,
            overallRange: 0..<100)
    }
}
