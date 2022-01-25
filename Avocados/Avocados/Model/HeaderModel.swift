//
//  HeaderModel.swift
//  Avocados
//
//  Created by Myron on 1/17/22.
//

import Foundation
import SwiftUI

struct Header: Codable, Identifiable{
    let id: UUID
    let image: String
    let headline: String
    let subheadline: String
}
