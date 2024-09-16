//
//  YouTubeAPIappApp.swift
//  YouTubeAPIapp
//
//  Created by Fatmanur Şahin on 16.09.2024.
//

import SwiftUI

@main
struct YouTubeAPIappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
