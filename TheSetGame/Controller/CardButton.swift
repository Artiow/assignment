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
        let symbolsString = Array(repeating: symbol, count: card.quantity.rawValue).joined(separator: "\n")
        let attributes:[NSAttributedStringKey : Any] = [
            .strokeColor: colors[card.color.idx],
            .strokeWidth: strokeWidths[card.background.idx],
            .foregroundColor: colors[card.color.idx].withAlphaComponent(alphas[card.background.idx])
        ]
        return NSAttributedString(string: symbolsString, attributes: attributes)
    }
    
    func initButton (card: Card) {
        let attributedString  = setAttributedString(card: card)
        setAttributedTitle(attributedString, for: .normal)
        borderColor = #colorLiteral(red: 0.714486698, green: 0.7708367465, blue: 0.7669996681, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9098039216, blue: 0.9019607843, alpha: 1)
        isEnabled = true
    }
    
    private struct Colors {
        static let selected = #colorLiteral(red: 0.5827867383, green: 0.6322943891, blue: 0.629147291, alpha: 1)
        static let matched = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        static var misMatched = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
}
