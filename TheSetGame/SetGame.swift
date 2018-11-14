import Foundation

class SetGame {
    
    private let initialCardCount = 12
    private var deck: Deck
    var cardsOnTable: [Card]
    
    init() {
        deck = Deck()
        deck.shuffle()
        cardsOnTable = [Card]()
        for _ in stride(from: 0, to: initialCardCount, by: 1) {
            if let card = deck.pop() {
                cardsOnTable.append(card)
            }
        }
    }
    
    
    
}
