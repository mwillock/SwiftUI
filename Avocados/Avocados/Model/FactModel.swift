//
//  FactModel.swift
//  Avocados
//
//  Created by Myron on 1/17/22.
//

import Foundation
import SwiftUI


struct Fact : Codable , Identifiable{
    let id: UUID
    let image: String
    let content: String
    
}
