//
//  FruitNutiView.swift
//  Fruits
//
//  Created by Myron on 12/4/21.
//

import SwiftUI

struct FruitNutiView: View {
    //MARK: - PROPERIES
    var fruits: Fruit
    let nutrients: [String] = ["Energy","Sugar","Fat","Protien","Vitamins","Minerals"]
    //MARK: - BODY
    var body: some View {
        GroupBox(){
            DisclosureGroup("Nutritional value per 100g"){
                ForEach(0..<nutrients.count, id:\.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }//:Group
                        .foregroundColor(fruits.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(fruits.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }//: HStack
                }//:ForEach
            }
    
        }//: GroupBox
    }
}
//MARK: - PREVIEWS
struct FruitNutiView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutiView(fruits: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
