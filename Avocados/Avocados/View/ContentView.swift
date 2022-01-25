//
//  ContentView.swift
//  Avocados
//
//  Created by Myron on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    var headers : [Header] = headerData
    var facts: [Fact] = factData
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment:.center , spacing: 20){
                //MARK: - HEADER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { items in
                            HeaderView(header: items)
                        }
                    }//:HStack
                }//:ScrollView
                //MARK: - DISHES
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                DishesView()
                    .frame(maxWidth:640)
                
                //MARK: - AVOCADO FACTS
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 60){
                        ForEach(facts) { item in
                            FactsView(facts: item)
                        }//:Loop
                    }//:HStack
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }//:ScrollView
                
                //MARK: - FOOTER
                
                VStack (alignment:.center, spacing: 20){
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                        .frame(minHeight: 60)
            
                        
                    Text("Everything you wanted to know about avocados but were afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }//:VSTACK
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }//:VStack
       
        }//:ScrollView
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headerData, facts: factData)
    }
}
