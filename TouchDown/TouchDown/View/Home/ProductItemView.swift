//
//  ProductItemView.swift
//  TouchDown
//
//  Created by Myron on 12/25/21.
//

import SwiftUI

struct ProductItemView: View {
    //MARK: - PROPERTIES
    
    let products: Product
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            //Photo
            ZStack{
                Image(products.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                }//:ZStack
            .background(Color(red: products.red, green: products.green, blue: products.blue))
            .cornerRadius(12)
            
            //Name
            Text(products.name)
                .font(.title3)
                .fontWeight(.black)
            
            //Price
            Text(products.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        })//:VStack
            
    }
}
//MARK: - PREVIEW
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(products: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
