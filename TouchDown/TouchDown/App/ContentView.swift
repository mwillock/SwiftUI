//
//  ContentView.swift
//  TouchDown
//
//  Created by Myron on 12/21/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                    //Get Devices Safe area and uses that as top padding to avoid be getting cut off at the notvh
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                   
                    ScrollView(.vertical, showsIndicators: false, content: {
                        //VStack(spacing: 0){
                        FeaturedTabView()
                            //Manually sized frame
                            .frame(height: UIScreen.main.bounds.width / 1.475)
                            .padding(.vertical , 10)
                        
                        CategoryGridView()
            
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, spacing: 15, content: {
                            ForEach(products) { product in
                                ProductItemView(products: product)
                                    .padding(15)
                                    .onTapGesture {
                                        withAnimation(.easeOut){
                                            shop.selectedProduct = product
                                            shop.showingProduct = true
                                        }
                                    }
                            }//:ForEach
                        })//:Grid
                        
                        TitleView(title: "Brands")
                        
                        BrandGridView()
                        
                        FooterView()
                             .padding(.horizontal)

                        //}//:VStack
                    })//Scroll View
                    
     
                }//:VStack
                /*
                 Applying ignore safe area w/ background modifier allows us to graps the entire screen
                 */
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }//:ZStack
        .ignoresSafeArea(.all, edges: .top)
        
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Must provide this modifier to see updates on preview
            .environmentObject(Shop())
    }
}
