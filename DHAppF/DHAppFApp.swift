//
//  interactiveAppsApp.swift
//  interactiveApps
//
//  Created by Ong Eason on 15/1/2024.
//

import SwiftUI
import SwiftData

@main
struct interactiveAppsApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .modelContainer(for: MenuItem.self)
        }
    }
}

