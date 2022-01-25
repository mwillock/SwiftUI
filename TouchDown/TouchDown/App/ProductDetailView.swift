//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by Myron on 12/27/21.
//

import SwiftUI

struct ProductDetailView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            //NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top,  UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            //HEADER
            HeaderDetailView()
                .padding(.horizontal)
            
            //DETAIL TOP PART
            TopPartDetailView()
                //Z-INDEX allows you to place views above one another
                .zIndex(1)
                .padding(.horizontal)
            
            //DETAIL BOTTOM PART
            VStack(alignment: .center, spacing: 0, content: {
                //RATINGS + SIZES
                RatingSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                //DESCRIPTION
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                })//:SCROLLVIEW
                //QUANTITES + FAVORITE
                QuantityFavoriteDetailView()
                    .padding(.vertical , 10)
                //ADD TO CAR
                AddToCartDetailView()
                    .padding(.bottom, 20)
            })//:VStack
                .padding(.horizontal)
                .background(
                    Color.white
                        .clipShape(CustomShape())
                        .padding(.top, -105)
                )
        })//:VStack
            .zIndex(0)
            .ignoresSafeArea(.all,edges: .all)
            .background(
                Color (red: shop.selectedProduct?.red ?? sampleProduct.red,
                      green: shop.selectedProduct?.green ?? sampleProduct.green,
                      blue: shop.selectedProduct?.blue ?? sampleProduct.blue
                     ).ignoresSafeArea(.all,edges: .all)
            )
    }
}
//MARK: - PREVIEW
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
