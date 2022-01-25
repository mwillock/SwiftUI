//
//  OnboardingView.swift
//  Fruits
//
//  Created by Myron on 12/2/21.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTY
    
    var fruits: [Fruit] = fruitsData
    //MARK: - BODY
    var body: some View {
        TabView{
            //Typicallt dont show more than 4-5 page on a onboarding screen
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
                
            }//End of loop
        }//End of TabView
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}
//MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
