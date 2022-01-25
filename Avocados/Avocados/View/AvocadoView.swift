//
//  AvocadoView.swift
//  Avocados
//
//  Created by Myron on 1/19/22.
//

import SwiftUI

struct AvocadoView: View {
    //MARK: - PROPERTIES
    
    @State private var pulsateAnimation: Bool = false
    
    //MARK: - BODY
    var body: some View {
            VStack(alignment: .center, spacing: 6){
                Spacer()
                
                Image("avocado")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 240, height: 240,alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                    .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                    .opacity(self.pulsateAnimation ? 1 : 0.9)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                
                VStack {
              
                    Text("Avocado".uppercased())
                        .font(.system(size: 42, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding()
                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
               
                
                Text("Sample Data")
                    .lineLimit(nil)
                    .font(.system(.headline , design: .serif))
                    .foregroundColor(Color("ColorGreenLight"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .frame(maxWidth: 640, minHeight: 120)
                
              
                }//:VStack
                .padding()
                
                Spacer()
                
            }//:VStack
        
            .background(
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            )
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                self.pulsateAnimation.toggle()
            })
    }
}
//MARK: - PREVIEW
struct AvocadoView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadoView()
    }
}
