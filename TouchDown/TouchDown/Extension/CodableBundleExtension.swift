//
//  CodableBundleExtension\.swift
//  TouchDown
//
//  Created by Myron on 12/23/21.
//

import SwiftUI

extension Bundle {
    // <Of Type T , returning type T
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the Json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        //3. Create a decoder
        let decoder = JSONDecoder()
        //4. Create a property for the decoded data
        guard let decodedData  = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        //5. Return the ready-to-use data
        return decodedData
    }
}
