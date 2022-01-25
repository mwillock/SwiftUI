//
//  CoverImageView.swift
//  African Animals
//
//  Created by Myron on 12/5/21.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: - BODY

    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//:ForEach
        }//:End of TabView
        .tabViewStyle(PageTabViewStyle())
    
    }
}
//MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
