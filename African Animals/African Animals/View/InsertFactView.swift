//
//  InsertFactView.swift
//  African Animals
//
//  Created by Myron on 12/6/21.
//

import SwiftUI

struct InsertFactView: View {
    //MARK: - PROPERTIES
    var animal: Animal
    //MARK: - BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: Tab
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:148, idealHeight: 168, maxHeight: 180)
        }//:GroupBox
    }
}
//MARK: - PREVIEW
struct InsertFactView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
