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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
