//
//  HomeView.swift
//  Restart
//
//  Created by Myron on 11/16/21.
//

import Foundation
import SwiftUI

struct HomeView: View{
    //MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    //Animiation Property
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    var body: some View{
        VStack(spacing: 20) {
            //MARK: - HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                            ,value: isAnimating
                        )
            }
            
            //MARK: - CENTER
            Text("The time that leads to mastery is depenedent on the intensity of our focus ")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOOTER
            
            Spacer()
            //When making a button label, swfit respects horizontal layout
            Button(action: {
                withAnimation{ // Since there is no set animations, it will use default
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }

            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
            }//: End of Button
            //Button Modifiers
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: End of VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}
//MARK: - PREVIEW
struct HomeView_Preview: PreviewProvider {
    static var previews: some View{
        HomeView().previewDevice("iPhone 11")
            
    }
    
}
