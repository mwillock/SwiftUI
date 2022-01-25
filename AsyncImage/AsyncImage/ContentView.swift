//
//  ContentView.swift
//  AsyncImage
//
//  Created by Myron on 11/16/21.
//

import SwiftUI

struct ContentView: View {
    //Privatly Store web adress in a string
    private let imageURL : String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
    //MARK: - 1. Basics
        //Download and load Url. Default gray placeholder if URL is invalid
       // AsyncImage(url: URL(string: imageURL))
    
    //MARK: - 2. Scale
        //image default scale is 1.0; Increase the scale to lower its size
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
    //MARK: - 3. Placeholder
        /* CANNOT apply image modifiers directly to an AsyncImage,
             Resizeable & etc... should be applied to the closure */
        /*
        AsyncImage(url: URL(string: imageURL)){ image in
            image
                .imageModifer()
        }placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }
        .padding(40)
         */
        
    //MARK: - 4. Phase
        /* Using Phase to gain control over the loading process
         Takes a closure that recieves an imagePhase to indicate the state of loading operation
         This will return a View corresponding to the current phase
         */
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            //SUCCESS: The image was successfully loaded
//            //FAILURE: The image failed to load with an error
//            //EMPTY: No image loaded
//
//            if let image = phase.image{
//                image.imageModifer()
//            }else if phase.error != nil{
//                Image(systemName: "ant.circle.fill").iconModifier()
//            }else{
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        
    //MARK: - Animation
        //Since the phase keeps track; the switch statement can be utilized for specific implementation
        //Enabling developers to apply transitions to designated reactions
        AsyncImage(url: URL(string: imageURL),
                   transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) {phase in
            switch phase{
            case .success(let image):
                image
                    .imageModifer()
                //Transition Options
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").imageModifer()
            case .empty:
                Image(systemName: "photo.circle.fill").imageModifer()
            @unknown default:
                ProgressView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Image {
    func imageModifer() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .imageModifer()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}
