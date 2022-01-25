//
//  Constant.swift
//  TouchDown
//
//  Created by Myron on 12/21/21.
//

import SwiftUI

/*
 This file will hold all global constants.
 Purpose it to collect essentail Content suvh as:
 Fonts, Colors, Images, Strings, Urls, etc..
 */

//MOST COMMON TYPES:

//DATA
//Data Constant to reduce time spent resusing code

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")

//Sample products -> Utilizing this to test functionatility before passing data
let sampleProduct: Product = products[0]

//COLOR

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color  = Color(UIColor.systemGray4)

//LAYOUT

let columSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
/*
 Storing the compuated property as a var oppose to everthing else being a constant
    This grid layout is the format for any two row/colum grid, horizontal or vertical
 */
var gridLayout: [GridItem]{
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

//UX
//API
//IMAGE
//FONT
//STRING
//MISC
