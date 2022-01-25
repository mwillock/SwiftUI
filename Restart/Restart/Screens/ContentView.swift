//
//  ContentView.swift
//  Restart
//
//  Created by Myron on 11/16/21.
//

import SwiftUI
  
struct ContentView: View {
  /* Centeral hub of application:
   Depening on state it will either show Home screen or Onboarding screen
   Need two things:
        1) Having a property that will hold our app inital and further states  */
    //1
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //Will setup a new Onboarding Key & App Stroage.
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
