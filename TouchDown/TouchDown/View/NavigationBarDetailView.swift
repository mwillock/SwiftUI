//
//  NavigationBarDetailView.swift
//  TouchDown
//
//  Created by Myron on 12/27/21.
//

import SwiftUI

struct NavigationBarDetailView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeIn){
                    shop.showingProduct = false
                    shop.selectedProduct = nil
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })//:Button
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }//:HStack
    }
}
//MARK: - PREVIEW
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
