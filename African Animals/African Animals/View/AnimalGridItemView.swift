//
//  AnimalGridItemView.swift
//  African Animals
//
//  Created by Myron on 12/17/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES
    
    let animal : Animal
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
    }
}
//MARK: - PREVIEW
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}