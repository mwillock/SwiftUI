//
//  ContentView.swift
//  Learn By Doing
//
//  Created by Myron on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    var cards: [Card] = CardData
    
    //MARK: - CONTENT
    var body: some View {
        ScrollView (.horizontal , showsIndicators: false){
            HStack (alignment: .center, spacing: 6){
                ForEach(cards) { item in
                    CardView(card: item)
                    //Text("card")
                }
            }//:HStack
            .padding()
        }//:ScrollView
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: CardData)
    }
}
