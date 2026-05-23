//
//  Tiktok_CloneApp.swift
//  Tiktok Clone
//
//  Created by Ryandra Anditto on 29/04/26.
//

import SwiftUI

@main
struct Tiktok_CloneApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appState)
        }
    }
}
