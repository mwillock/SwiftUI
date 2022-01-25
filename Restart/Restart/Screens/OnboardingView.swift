//
//  OnboardingView.swift
//  Restart
//
//  Created by Myron on 11/16/21.
//

import Foundation
import SwiftUI

struct OnboardingView: View{
    //MARK: - Property
    /*
     Creating a property to acces Appstorage property wrapper
     
     This true value is only added when they CANNOT find the
     *Onboarding Key* in the user storage
     
     If the *Onboarding Key* is found in user default storage then it will skip
     this initializtion (everything after it)
     */
    
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = true
    
    //These properties primary purpose to establish some constraints to the horizontal button movement
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    /*
     This prorperty will repersent the asset value in the horizontal direction
     This offest value will constantly changing during the dragging activity
     */
    @State private var butttonOffset: CGFloat = 0
    
    //This property is to track/control the state of the animiation
    @State private var isAnimating: Bool = false
    
    //Storing the image offset value
    @State private var imageOffest: CGSize = .zero //Same Zero Property, just less code required
    //Arrow Symbol opacity
    @State private var indicatorOpacity: Double = 1.0
    //Text Title
    @State private var textTitle = "Share."
    //Haeptic Property
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    //MARK: - Body
    var body: some View{
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20) {
                //MARK: - HEADER
                Spacer()
                
                //Code folding: Option, Command, <- (left arrow)
                VStack(spacing:0){
                    /* Solved by utilizing .identifiable view(Modifier) */
                    Text(textTitle) //Swift Consider this change the same regarless of the value
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    //multi-lined longer text
                    Text("""
                            It's not how much we give but
                            how much love we put into giving.
                            """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }//:End of Header Section
                //Header modifications
                    //MARK: - HEADER ANIMATIONS
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40) //Sliding down movement
                .animation(.easeOut(duration: 1), value: isAnimating)
                //Animation Param: Easeout type w/ a 1 sec duration, What value that causes the change in animation
                //MARK: - CENTER
                ZStack{
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffest.width * -1) //Opposite Direction When dragging 
                        .blur(radius: abs(imageOffest.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffest)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                    //MARK: - Image ANIMATIONS
                        .opacity(isAnimating ? 1 :0)
                        .animation(.easeOut(duration: 0.8), value: isAnimating)
                        .offset(x: imageOffest.width * 1.2 , y: 0) //Move Image in desired direction
                        .rotationEffect(.degrees(Double(imageOffest.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    //Abs: Absoulte value setting a limit of 150, both direction
                                    if abs(imageOffest.width) <= 150 {
                                        imageOffest = gesture.translation
                                        //Getsture.Translation: The total movment from the start of drag gesuture to current
                                        
                                        withAnimation(.linear(duration: 0.25)){
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded{ _ in
                                    imageOffest = .zero
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }

                                }
                        )//:End of Gesture
                        //MODIFIERS
                        .animation(.easeOut(duration: 0.5), value: imageOffest)
                    
                }//: End of Center Section
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44,  weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1: 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    ,alignment: .bottom
                )
                
                Spacer()
                //MARK: - FOOTER
                ZStack{
                    //Part of the Custom Button
                    
                    //1. Background (Static)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    //2. Call to action Text (Static)
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    //3. Capsule Shape (Dynamic Width) - This will change when users are dragging the button
                        //Update the width button upset, following the size of the button size
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: butttonOffset + 80)
                        
                        Spacer()
                    }
                    //4. Circle (Draggable)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                                
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }//:End of ZStack
                        //Container Modifers
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: butttonOffset)
                        
                        //MARK: - Gesture Actions
                        .gesture(
                            /*
                                   DragGesture: Has Two states;
                                       (1) When the drag user activity is happening
                                       (2) When the drag activity has ended
                                   */
                            DragGesture()
                                .onChanged{ gesture in  //Action Closuree
                                    /*
                                            This will only run when the button been started in the right direction
                                            We are capturing the actual drag movement's width for later use
                                            */
                                    if gesture.translation.width > 0 && butttonOffset <= buttonWidth - 80 {
                                        butttonOffset = gesture.translation.width
                                    }
                                } //: End of on change
                                .onEnded{ _ in
                                    //Auto-Complete-Slider left and right side
                                    withAnimation(Animation.easeOut(duration: 0.6)){
                                        if butttonOffset > buttonWidth / 2{
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            butttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }else{
                                            hapticFeedback.notificationOccurred(.warning)
                                            butttonOffset = 0
                                        }
                                    }
                                }
                        )//: End of Gesture
                        
                        Spacer()
                    }//: End of HStack
                    
                }//:End of Footer Section
                //MARK: - Modifier/ Animation on the Footer container
                .frame(width: buttonWidth, height:80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }//: End of VStack
        } //: End of ZStack
        //ZStack Modifiers
        .onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark) //Requesting a dark colored display (Dark Mode)
    }
}
//MARK: - Preview
struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View{
        OnboardingView().previewDevice("iPhone 11").previewInterfaceOrientation(.portrait)
            
    }
    
}
