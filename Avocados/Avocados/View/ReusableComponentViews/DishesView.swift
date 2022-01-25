//
//  DishesView.swift
//  Avocados
//
//  Created by Myron on 1/20/22.
//

import SwiftUI

struct DishesView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        HStack() {//Row
            VStack (alignment: .leading, spacing: 4){//1st Column
                HStack() {
                    Image("icon-toasts")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Toast")
                }
                Divider()
                HStack() {
                    Image("icon-tacos")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Tacos")
                }
                Divider()
                HStack() {
                    Image("icon-salads")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Salads")
                }
                Divider()
                HStack() {
                    Image("icon-halfavo")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Spreads")
                }
            }
            
            VStack (alignment: .center, spacing: 16){//2nd Column
                //Vertically align dividers
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }
            
            VStack (alignment: .trailing, spacing: 4){//3rd Column
                HStack() {
                    Text("Sandwich")
                    Spacer()
                    Image("icon-sandwiches")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Soup")
                    Spacer()
                    Image("icon-soup")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Guacamole")
                    Spacer()
                    Image("icon-guacamole")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Smoothie")
                    Spacer()
                    Image("icon-smoothies")
                        .resizable()
                        .modifier(IconModifier())
                }
                
            }
        }//:HStack
        .font(.system(.callout,design: .serif))
        .foregroundColor(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
               
    }
}
struct IconModifier:ViewModifier {
    func body (content: Content) -> some View{
        content
        //fontweight modifer will throw an error
            .frame(width: 42, height: 42, alignment: .center)
    }
}

//MARK: - MODIFIER

//func IconModifer()
//MARK: - PREVIEW

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
            .previewLayout(.fixed(width: 414, height: 280))
    }
}
