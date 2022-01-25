//
//  QuantityFavoriteDetailView.swift
//  TouchDown
//
//  Created by Myron on 12/29/21.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
    //MARK: - PREVIEW
    @State private var counter: Int = 0
    @State private var isSelected: Bool = false
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button(action: {
                if counter > 0 {
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth:36)
            
            Button(action: {
                if counter < 100 {
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            Spacer()
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor( isSelected ? .pink : .gray)
            })
            
        })//:HStack
            .font(.system(.title, design: .rounded))
            .foregroundColor(.black)
            .imageScale(.large)
            .onAppear(perform: {
                withAnimation(.spring()){
                    isSelected = false
                }
            })
    }
}
//MARK: - PREVIEW
struct QuantityFavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavoriteDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
}
