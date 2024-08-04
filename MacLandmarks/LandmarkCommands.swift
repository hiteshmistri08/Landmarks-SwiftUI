//
//  LandmarkCommands.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 04/08/24.
//

import SwiftUI

struct LandmarkCommands: Commands {
    var body: some Commands {
        SidebarCommands()
    }
}

struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
