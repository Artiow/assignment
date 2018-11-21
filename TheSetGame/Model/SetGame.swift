import Foundation

class SetGame {
    
    private let initialCardCount = 12
    private let cardCountToDeal = 3
    private let maxCardCount: Int
    
    private var deck: Deck
    private var selectedCards: [Card]
    
    var cardsOnTable: [Card]
    
    init(maxCardCount: Int) {
        self.maxCardCount = maxCardCount
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
        for _ in 1...cardCountToDeal {
            if let card = deck.pop() {
                cards += [card]
            } else {
                return nil
            }
        }
        return cards
    }
    
    func deal() {
        if cardsOnTable.count + cardCountToDeal <= maxCardCount, let cards = popCards(count: cardCountToDeal) {
            cardsOnTable += cards
        }
    }
    
    func selectCard(at index: Int) {
        let selectedCard = cardsOnTable[index]
        if !selectedCards.contains(selectedCard){
            selectedCards
        }
    }
    
    
}
