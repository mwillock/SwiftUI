//
//  Notes.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/15/22.
//

import Foundation

struct Note : Identifiable, Codable {
    let id: UUID
    let text: String
}
