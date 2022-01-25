//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/16/22.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 3){
            Image("developer-no3")
                .resizable()
                .scaledToFit()
            
            HeaderView(title: "Credits")
            
            Text("Myron (OG)")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
        .padding()
    }
}
//MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
