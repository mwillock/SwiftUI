//
//  DevoteApp.swift
//  Devote
//
//  Created by Myron on 1/1/22.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
            //This meant to store our active core data managed data context
        }
    }
}
