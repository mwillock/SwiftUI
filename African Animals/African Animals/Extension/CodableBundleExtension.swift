//
//  CodableBundleExtension.swift
//  African Animals
//
//  Created by Myron on 12/5/21.
//

import Foundation


extension Bundle{
    //T for Type
    func decode<T: Codable>(_ file: String) -> T { // an array of cover images
        //1. Locate the JSon file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle") //Crashes App
        }
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        //3. Create a property for the decoded data
        let decoder = JSONDecoder()
        //4. Return the ready-to-use data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle")
        }
        //5. Return the ready to use data
        return loaded
    }
}
