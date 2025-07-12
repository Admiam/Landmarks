//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Adam Míka on 30.06.2025.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
