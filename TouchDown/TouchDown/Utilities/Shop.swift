//
//  Shop.swift
//  TouchDown
//
//  Created by Myron on 12/29/21.
//

import SwiftUI

/*
 This Obserable Object: Allows instance of this class can be used inside any View
    -When important changes happen, the View will reload
    -To make this work, We must inform the swift which data it should continously watch 
 */


class Shop: ObservableObject {
   @Published var showingProduct: Bool = false // Show or hide detailView
   @Published var selectedProduct: Product? = nil // Which Selected product to show   
    
}
