//
//  CardButton.swift
//  TheSetGame
//
//  Created by xcode on 14.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

@IBDesignable class CardButton : BorderButton {
    
    let colors = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
    let alphas:[CGFloat] = [1.0, 0.40, 0.15]
    let strokeWidths:[CGFloat] = [ -8, 8, -8]
    let symbols = ["●", "■", "▲"]
    
    private func setAttributedString(card: Card) -> NSAttributedString{
        let symbol = symbols[card.shape.idx]
        let symbolsString = String(repeating: symbol, count: card.quantity.rawValue)
        let attributes:[NSAttributedStringKey : Any] = [
            .strokeColor: colors[card.color.idx],
            .strokeWidth: strokeWidths[card.background.idx],
            .foregroundColor: colors[card.color.idx].withAlphaComponent(alphas[card.background.idx])
        ]
        return NSAttributedString(string: symbolsString, attributes: attributes)
    }
    
}
