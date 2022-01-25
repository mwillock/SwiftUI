//
//  FactsView.swift
//  Avocados
//
//  Created by Myron on 1/22/22.
//

import SwiftUI

struct FactsView: View {
    //MARK: - PROPERTIES

    var facts: Fact
    
    //MARK: - BODY
    var body: some View {
    ZStack{
        Text(facts.content)
            .padding(.leading, 55)
            .padding(.trailing, 10)
            .padding(.vertical, 3)
            .frame(width: 300, height: 135, alignment: .center)
            .background(LinearGradient(gradient:
                                        Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]),
                                       startPoint: .leading, endPoint: .trailing))
            .cornerRadius(12)
            .lineLimit(6)
            .multilineTextAlignment(.leading)
            .font(.footnote)
            .foregroundColor(Color.white)
        
        Image(facts.image)
            .resizable()
            .frame(width: 66, height: 66, alignment: .center)
            .clipShape(Circle())
            .background(
                Circle()
                    .fill(Color.white)
                    .frame(width: 74, height: 74, alignment: .center)
            )
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .trailing, endPoint: .leading))
                    .frame(width: 82, height: 82, alignment: .center)
            )
            .background(
                Circle()
                    .fill(Color("ColorApperenceAdaptice"))
                    .frame(width: 90, height: 90, alignment: .center)
            )
            .offset(x: -150)
        }
    }
}
//MARK: - PREVIEW
struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(facts: factData[0])
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
