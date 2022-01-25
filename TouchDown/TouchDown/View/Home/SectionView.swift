//
//  SectionView.swift
//  TouchDown
//
//  Created by Myron on 12/24/21.
//

import SwiftUI

struct SectionView: View {
    //MARK: - PROPERTIES
    @State var rotateClockwise: Bool
    //MARK: - BODY
    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            
            Text("Categoties".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: -90))
            
        Spacer()
        }//: VStack
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}
//MARK: - PREVIEW
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
