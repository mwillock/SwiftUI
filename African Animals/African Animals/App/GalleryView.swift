//
//  GalleryView.swift
//  African Animals
//
//  Created by Myron on 12/5/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    @State private var SelectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    /*
    Simple Grid Definition
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]*/
    
    //Efficient Grid Definition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic Grid Layout
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array (repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY

    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {

            VStack(alignment: .center, spacing: 30) {
                //MARK: - IMAGE
                Image(SelectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                //MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                //MARK: - GRID (LazyVGrid)
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { item in
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .onTapGesture {
                                    SelectedAnimal = item.image
                                    haptics.impactOccurred()
                                }
                            }
                    }//:Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
                }//:VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            }//:Scroll
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}
//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
