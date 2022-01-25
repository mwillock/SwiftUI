//
//  ContentView.swift
//  Fruits
//
//  Created by Myron on 11/29/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    
    var fruits: [Fruit] = fruitsData
    
    @State private var isShowingSetting: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()){ item in
                    NavigationLink(destination: FruitDetailView(fruit: item)){
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }//:Nav Link

                }//:ForEach
            }//:List
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing: Button(action: {
                    isShowingSetting = true
                }){
                    Image(systemName: "slider.horizontal.3")
                }//:Button
                    .sheet(isPresented: $isShowingSetting){
                        SettingsView()
                    }
            )
        }//:NavView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
