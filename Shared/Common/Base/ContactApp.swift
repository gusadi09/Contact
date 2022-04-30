//
//  ContactApp.swift
//  Shared
//
//  Created by Gus Adi on 26/04/22.
//

import SwiftUI

@main
struct ContactApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
					NavigationView {
            HomeView()
					}
					.navigationViewStyle(.stack)
					.accentColor(.teal)
        }
    }
}
