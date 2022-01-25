//
//  AddToCartDetailView.swift
//  TouchDown
//
//  Created by Myron on 12/29/21.
//

import SwiftUI

struct AddToCartDetailView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var shop : Shop
    
    //MARK: - BODY
    var body: some View {
        Button(action: {}, label: {
            //By adding a spacer it extends the buttons across the screen
            Spacer()
            
            Text("Add To cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
        })//:Button
            .padding(15)
            .background(
                Color( red: shop.selectedProduct?.red ?? sampleProduct.red,
                      green: shop.selectedProduct?.green ?? sampleProduct.green,
                      blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
            )
            .clipShape(Capsule())
    }
}
//MARK: - PREVIEW
struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
