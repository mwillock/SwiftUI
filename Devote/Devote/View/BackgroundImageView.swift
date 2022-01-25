//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Myron on 1/10/22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true) //Ensure smoothness of images regardless where it moves
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
