//
//  Deck.swift
//  TheSetGame
//
//  Created by xcode on 14.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct Deck {
    
    private (set) var cards = [Card]()
    
    init() {
        for quantity in Card.Variant.all {
            for shape in Card.Variant.all {
                for color in Card.Variant.all {
                    for background in Card.Variant.all {
                        cards.append(Card(quantity: quantity, shape: shape, color: color, background: background))
                    }
                }
            }
        }
    }
    
    mutating func pop() -> Card? {
        return cards.popLast()
    }
    
    mutating func shuffle() {
        let length = cards.count
        guard length > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(cards.indices, stride(from: length, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = cards.index(firstUnshuffled, offsetBy: d)
            cards.swapAt(firstUnshuffled, i)
        }
    }
    
}
