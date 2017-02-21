//
//  Pokemon.swift
//  pokeDex
//
//  Created by Nick Reichard on 2/21/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//
// LOOK at the JSON

import Foundation
import UIKit

class Pokemon {
    
    private let nameKey = "name"
    private let imageEndPointKey = "front_default"
    private let movesCountKey = "moves"
    private let idKey = "id"
    
    let name: String
    let imageEndpoint: String
    let moveCount: Int
    let id: Int
    var image: UIImage?
    
    // More intrakit JSON. Make sure you are parcing
    
    init?(dictionary: [String:Any]) {
        guard let name = dictionary[nameKey] as? String,   // holds all the images
            let spriteDictionary = dictionary["sprites"] as? [String: String],
            let imageEndpoint = spriteDictionary[imageEndPointKey],
            let movesArray = dictionary[movesCountKey] as? [[String:Any]],
            let id = dictionary[idKey] as? Int
            else { return nil }
        
      //  let moveCount = movesArray.count
        
        self.name = name
        self.imageEndpoint = imageEndpoint
        self.moveCount = movesArray.count  // The swift way
        self.id = id
        
        
    }
    
    
}
