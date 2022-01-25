//
//  InsertGalleryView.swift
//  African Animals
//
//  Created by Myron on 12/6/21.
//

import SwiftUI

struct InsertGalleryView: View {
    //MARK: - PROPERTIES
    let animal : Animal
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center, spacing: 15){
                ForEach(animal.gallery, id: \.self ) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }//:ForEach
            }//:HStack
        }//:ScrollView
        
    }
}
//MARK: - PREVIEW
struct InsertGalleryView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
