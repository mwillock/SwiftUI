//
//  CenterModifier.swift
//  African Animals
//
//  Created by Myron on 12/20/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View{
        HStack{
            /*
             These Spacers are used too help center the content on a View
             */
            Spacer()
            content
            Spacer()
        }
    }
}
