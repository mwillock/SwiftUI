//
//  FruitDetailView.swift
//  Fruits
//
//  Created by Myron on 12/3/21.
//

import SwiftUI

struct FruitDetailView: View {
    //MARK: - PROPERTIES
    
    var fruit: Fruit
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20){
                    // HEADER
                    FruitHeaderView(fruit: fruit)
                    VStack(alignment: .leading, spacing: 20) {
                        //TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        //HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        //NUTRIENTS
                        FruitNutiView(fruits: fruit)
                        //SUBHEADING
                        Text("Learn More About \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        //DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        //LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                    }//: VStack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
            }//: VStack
                //Hidding the nav bar to create more space on screen
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
        }//: Scroll
            .edgesIgnoringSafeArea(.top)
    }//: Nav
        .navigationViewStyle(StackNavigationViewStyle())
  }
}
//MARK: - PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
