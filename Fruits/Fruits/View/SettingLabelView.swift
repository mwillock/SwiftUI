//
//  LabelView.swift
//  Fruits
//
//  Created by Myron on 12/4/21.
//

import SwiftUI

struct SettingLabelView: View {
    //MARK: - PROPERTIES
    var labelText: String
    var labelImage: String
    var body: some View {

        //MARK: - BODY
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}
//MARK: - PREVIEW
struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelView(labelText: "Fruit", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
