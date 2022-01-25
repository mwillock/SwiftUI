//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by Myron on 12/23/21.
//

import SwiftUI

struct FeaturedTabView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach (players) { player in
             FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }//: ForEach
        }//: TabView
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
//MARK: - PREVIEW
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .background(Color.gray)
    }
}
