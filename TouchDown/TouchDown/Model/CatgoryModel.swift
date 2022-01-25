//
//  CatgoryModel.swift
//  TouchDown
//
//  Created by Myron on 12/24/21.
//

import SwiftUI


struct Category: Codable, Identifiable {
    let id : Int
    let name: String
    let image: String
}
