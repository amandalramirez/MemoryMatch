//
//  MemoryMatch.swift
//  Memory Match
//
//  Created by Amanda Ramirez on 5/6/18.
//  Copyright © 2018 Amanda Ramirez. All rights reserved.
//
// API

import Foundation

class MemoryMatch {
    
    var cards = [Card]()
     var shuffledCards = [Card]()
    
    var indexOfOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFacedUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyFacedUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        var unShuffeldCards: [Card] = []
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            unShuffeldCards += [card, card]
        }
        //    TODO: Shuffle the cards
        while !unShuffeldCards.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(unShuffeldCards.count)))
            let card = unShuffeldCards.remove(at: randomIndex)
            cards.append(card)
        }

    }
    
}
