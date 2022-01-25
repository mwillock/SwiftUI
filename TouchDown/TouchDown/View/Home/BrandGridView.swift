//
//  BrandGridView.swift
//  TouchDown
//
//  Created by Myron on 12/25/21.
//

import SwiftUI

struct BrandGridView: View {
    //MARK: - PROPERTIES
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columSpacing, content: {
                ForEach(brands) { brand in
                    BrandView(brands: brand)
                }
            })//:Grid
                .frame(height: 200)
                .padding(15)
        })//:ScrollView
    }
}
//MARK: - PREVIEW
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .foregroundColor(colorBackground)
    }
}
