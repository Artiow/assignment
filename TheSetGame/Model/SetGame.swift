import Foundation

class SetGame {
    
    private let initialCardCount = 12
    private let cardCountToDeal = 3
    private let maxCardCount: Int
    
    private (set) var deck: Deck
    private (set) var cardsOnTable: [Card]
    private (set) var selectedCards: [Card]
    private (set) var isSet = false
    private (set) var removedCards: [Card]

    private (set) var score = 0
    
    init(maxCardCount: Int) {
        self.maxCardCount = maxCardCount
        deck = Deck()
        deck.shuffle()
        cardsOnTable = [Card]()
        selectedCards = [Card]()
        removedCards = [Card]()
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
        if !removedCards.contains(selectedCard), !selectedCards.contains(selectedCard) {
            if selectedCards.count < 3 {
                selectedCards.append(selectedCard)
                if (selectedCards.count == 3) {
                    isSet = isSet(cards: selectedCards)
                    score += isSet ? 5 : (score > 3 ? -3 : -score)
                }
            }
        } else {
            selectedCards.remove(at: selectedCards.index(of: selectedCard)!)
        }
    }
    
    func isSet(cards: [Card]) -> Bool {
        let sum = [
            cards.reduce(0, { $0 + $1.quantity.rawValue}),
            cards.reduce(0, { $0 + $1.color.rawValue}),
            cards.reduce(0, { $0 + $1.shape.rawValue}),
            cards.reduce(0, { $0 + $1.background.rawValue})
        ]
        return sum.reduce(true, { $0 && ($1 % 3 == 0) })
    }
    
    func removeSet() {
        if isSet {
            removedCards.append(contentsOf: selectedCards)
            for card in selectedCards {
                cardsOnTable.remove(at: cardsOnTable.index(of: card)!)
            }
            selectedCards.removeAll()
            isSet = false
        } else {
            selectedCards.removeAll()
            isSet = false
        }
    }
    
    func giveHint() -> [Int]? {
        score += (score > 4 ? -4 : -score)
        if let indices = findSetIndices() {
            return indices
        } else {
            return nil
        }
    }
    
    private func findSetIndices() -> [Int]? {
        if cardsOnTable.count > 2 {
            for i in 0..<cardsOnTable.count {
                for j in (i + 1)..<cardsOnTable.count {
                    for k in (j + 1)..<cardsOnTable.count {
                        let cards = [cardsOnTable[i], cardsOnTable[j], cardsOnTable[k]]
                        if isSet(cards: cards) {
                            return [i, j, k]
                        }
                    }
                }
            }
        }
        return nil
    }
    
    
}
