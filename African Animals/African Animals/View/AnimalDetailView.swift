//
//  AnimalDetailView.swift
//  African Animals
//
//  Created by Myron on 12/6/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack (alignment: .center, spacing: 20){
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background( //Underline
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsertGalleryView(animal: animal)
                }
                //Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactView(animal: animal)
                }//:Group
                .padding(.horizontal)
                
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)s")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }//: Group
                .padding(.horizontal)
                
                //Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                }//:Group
                .padding(.horizontal)
                
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    InsertLinkView(animal: animal)
                        .padding(.vertical, 10)
                }
                .padding(.horizontal)
            }//:VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//:ScrollView
        
    }
}
//MARK: - PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
