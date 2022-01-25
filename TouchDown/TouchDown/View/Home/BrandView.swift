//
//  BrandView.swift
//  TouchDown
//
//  Created by Myron on 12/25/21.
//

import SwiftUI

struct BrandView: View {
    //MARK: - PROPERTIES
    let brands : Brand
    //MARK: - BODY
    var body: some View {
        
        Image(brands.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(Color.white.cornerRadius(12))
            .background(
             RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 2)
            )
        


    }
}
//MARK: - PREVIEW
struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView(brands: brands[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
