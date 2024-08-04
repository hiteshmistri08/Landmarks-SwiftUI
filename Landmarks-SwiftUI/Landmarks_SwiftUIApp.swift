//
//  Landmarks_SwiftUIApp.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 30/05/24.
//

import SwiftUI

@main
struct Landmarks_SwiftUIApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
