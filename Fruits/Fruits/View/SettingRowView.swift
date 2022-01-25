//
//  SettingRowView.swift
//  Fruits
//
//  Created by Myron on 12/4/21.
//

import SwiftUI

struct SettingRowView: View {
    //MARK: - PROPERTIES
    var name : String
    var content : String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    //MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil ) {
                    Text(content!)
                } else if(linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(Color.pink)
                } else {
                    EmptyView()
                }
            }//HStack
        }
    }
}
//MARK: - PREVIEW
struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingRowView(name: "Developer", content: "OG")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingRowView(name: "Website", linkLabel: "The Spot", linkDestination: "github.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
