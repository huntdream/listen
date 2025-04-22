//
//  musicApp.swift
//  music
//
//  Created by Yu Mao on 4/11/25.
//

import SwiftUI
import SwiftData

@main
struct musicApp: App {
    @StateObject private var playerState = PlayerState()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer).environmentObject(playerState)
    }
}
