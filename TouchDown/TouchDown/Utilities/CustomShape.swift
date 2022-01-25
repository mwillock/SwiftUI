//
//  CustomShape.swift
//  TouchDown
//
//  Created by Myron on 12/29/21.
//

import SwiftUI

struct CustomShape: Shape {
    /*
     This will enable us to create a custom shape, using or creating a "path"
     Create curved lined segements on top corners
     To achieve this: Creating a blueprint sized and enable a path to utilize it through CGSize
     */
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
//MARK: - PREVIEW
struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape()
            .previewLayout(.fixed(width: 428, height: 120))
            .padding()
    }
}

