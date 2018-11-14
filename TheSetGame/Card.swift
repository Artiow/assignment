//
//  Card.swift
//  TheSetGame
//
//  Created by xcode on 07.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

extension MutableCollection {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

struct Card {
    
    private (set) var quantity : QuantityType
    private (set) var shape : ShapeType
    private (set) var color : ColorType
    private (set) var texture : TextureType
    
    static func generate() -> [Card] {
        var result = [Card]()
        for quantity in QuantityType.values {
            for shape in ShapeType.values {
                for color in ColorType.values {
                    for texture in TextureType.values {
                        result += [Card(quantity: quantity, shape: shape, color: color, texture: texture)]
                    }
                }
            }
        }
        
        return result.shuffled()
    }
}
