//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/16/22.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    
    var title: String = ""
    
    //MARK: - BODY
    var body: some View {
        VStack{
            //TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //SEPARTOR
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//:HStack
                .foregroundColor(.accentColor)

        }//:VStack
    }
}
//MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            
            HeaderView(title: "Credits")
        }
    }
}
