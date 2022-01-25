//
//  RecipeModel.swift
//  Avocados
//
//  Created by Myron on 1/17/22.
//

import Foundation
import SwiftUI

struct Recipe : Codable {
    
    let id : UUID
    let title: String
    let headline: String
    let image: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    
    let instructions: [String]
    let ingredients: [String]
}
