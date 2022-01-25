//
//  StartButtonView.swift
//  Fruits
//
//  Created by Myron on 12/2/21.
//

import SwiftUI

struct StartButtonView: View {
    
    //MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    //MARK: - BODY
    var body: some View {
        
        Button(action: {
            isOnboarding = false
        }){
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth:  1.25)
            )
        }//: End of Button
        .accentColor(Color.white)
        
    }
}
//MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView().preferredColorScheme(.dark).previewLayout(.sizeThatFits) //When focusing on one element
    }
}
