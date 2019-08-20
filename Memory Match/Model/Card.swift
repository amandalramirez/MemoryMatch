//
//  Card.swift
//  Memory Match
//
//  Created by Amanda Ramirez on 5/6/18.
//  Copyright © 2018 Amanda Ramirez. All rights reserved.
//

import Foundation

struct Card {
   
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var nextIdentifier = 0
    
    static func generateUniqueIdentifier() -> Int {
        nextIdentifier += 1
        return nextIdentifier
    }
    
    init(){
        self.identifier = Card.generateUniqueIdentifier()
    }
}
