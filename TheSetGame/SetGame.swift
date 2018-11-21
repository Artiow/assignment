import Foundation

class SetGame {
    
    private let initialCardCount = 12
    private let cardCountToDeal = 3
    private var deck: Deck
    var cardsOnTable: [Card]
    
    init() {
        deck = Deck()
        deck.shuffle()
        cardsOnTable = [Card]()
        for _ in 0...initialCardCount {
            if let card = deck.pop() {
                cardsOnTable.append(card)
            }
        }
    }
    
    private func popCards(count: Int) -> [Card]?{
        var cards = [Card]()
        for _ in 0...2 {
            if let card = deck.pop() {
                cards += [card]
            } else {
                return nil
            }
        }
        return cards
    }
    
    func deal3() {
        if let cards =  popCards(count: cardCountToDeal) {
            cardsOnTable += cards
        }
    }
    
    
    
}
