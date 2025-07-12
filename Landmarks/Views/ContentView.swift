//
//  ContentView.swift
//  Landmarks
//
//  Created by Adam Míka on 30.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}
#Preview {
    ContentView()
        .environment(ModelData())
}
