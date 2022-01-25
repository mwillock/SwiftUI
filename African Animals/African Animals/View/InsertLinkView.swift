//
//  InsertLinkView.swift
//  African Animals
//
//  Created by Myron on 12/7/21.
//

import SwiftUI

struct InsertLinkView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: ((URL(string: animal.link) ??
                                                     URL(string: "https://wikipedia.org"))!))
                         
                }
                .foregroundColor(.accentColor)
            }//:HStack
        }//:GroupBox
    }
}
//MARK: - PREVIEW
struct InsertLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
