//
//  CircleGroupView.swift
//  Restart
//
//  Created by Myron on 11/19/21.
//

import Foundation
import SwiftUI

//Creating a resualble component

struct CircleGroupView: View{
    //MARK: - PROPERTY
    //Creating Properties that repersent the Color & Opacity
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    
    //Animation Property: With a changable inital value
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    var body: some View{
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity),lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//End of ZStack
        .blur(radius: isAnimating ? 0 : 10) //*
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5) //*
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
        
    }
    
    //MARK: - PREVIEW
    
    struct CirclGroupView_Preview: PreviewProvider{
        static var previews: some View{
            ZStack {
                Color("ColorBlue")
                    .ignoresSafeArea(.all, edges: .all)
                CircleGroupView(shapeColor: Color.gray, shapeOpacity: 0.2)
            }
        }
    }
}
