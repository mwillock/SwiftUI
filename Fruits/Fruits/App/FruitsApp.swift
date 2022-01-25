//
//  FruitsApp.swift
//  Fruits
//
//  Created by Myron on 11/29/21.
//

import SwiftUI

@main
struct FruitsApp: App {
    //MARK: - PROPERTY
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    //MARK: - BODY
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            }else{
                ContentView()
            }
            
        }
    }
}
