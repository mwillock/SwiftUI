//
//  VideoModel.swift
//  African Animals
//
//  Created by Myron on 12/7/21.
//

import SwiftUI


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
