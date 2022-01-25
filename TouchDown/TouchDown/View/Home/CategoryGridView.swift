//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by Myron on 12/24/21.
//

import SwiftUI

struct CategoryGridView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columSpacing, pinnedViews: [], content: {
                Section(
                    header:SectionView(rotateClockwise: true) ,
                    footer:SectionView(rotateClockwise: true)) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }//:Section
            })//:HGrid
                .frame(height: 140)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
        })
    }
}
//MARK: - PREVIEW
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
