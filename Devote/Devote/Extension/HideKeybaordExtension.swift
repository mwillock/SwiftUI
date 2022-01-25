//
//  HideKeybaordExtension.swift
//  Devote
//
//  Created by Myron on 1/8/22.
//

import SwiftUI
//if statement the code inside, this condition will only run when we can import the UIkit framework
#if canImport(UIKit)
extension View{
    func hidekeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
