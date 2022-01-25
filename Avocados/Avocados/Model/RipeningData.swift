//
//  RipeningData.swift
//  Avocados
//
//  Created by Myron on 1/18/22.
//

import Foundation
import SwiftUI

struct Ripe : Codable {
    let id: UUID
    let image: String
    let stage: String
    let title: String
    let description: String
    let ripeness: String
    let instructions: String
}
