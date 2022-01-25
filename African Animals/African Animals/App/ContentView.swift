//
//  ContentView.swift
//  African Animals
//
//  Created by Myron on 12/4/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout : [GridItem] = [ GridItem(.flexible()) ]
    /* GridColum's purpose is to keep track of the column
        TabBarIcon will be used to hold the name of icon
     */
    @State private var gridColum: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColum = gridLayout.count
        print("Grid Number:\(gridColum)")
        
        //TOOLBAR IMAGE
        switch gridColum{
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY

    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) {animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//: ForEach
                        }//:ForEach
                        CreditView()
                            .modifier(CenterModifier())
                    } //: List
                }else{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }//:Loop
                        }//:End of grid
                        .padding(10)
                        .animation(.easeOut)
                    }//:Scroll
                }//: Conditional
            }//:Group
            .navigationBarTitle("Safari",displayMode:.large )
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack (spacing: 16){
                        //List
                        Button(action:{
                            print("ListView is Activated")
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        //Grid
                        Button(action: {
                            print("GridView is activated")
                            isGridViewActive = true
                            haptic.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//:HStack
                }
            }//:ToolBar
        }//End of Nav
    }
}
//MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
