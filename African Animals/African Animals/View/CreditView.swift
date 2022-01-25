//
//  CreditView.swift
//  African Animals
//
//  Created by Myron on 12/20/21.
//

import SwiftUI

struct CreditView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        //Multi-lined Text 3 quotations
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyrights © Myron Willock
    All Rights reserved
    Better Apps ♡ Less Code
    """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        }//:VStack
        .padding()
        .opacity(0.4)
    }
}
//MARK: - PREVIEW
struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
