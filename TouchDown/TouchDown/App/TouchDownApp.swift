//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by Myron on 12/21/21.
//

import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Modifier allows us to create views with shared data
                .environmentObject(Shop())
        }
    }
}
