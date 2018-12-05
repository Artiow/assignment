import UIKit

class ViewController: UIViewController {

    private lazy var game = SetGame(maxCardCount: cardButtons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtons()
        updateViewFromModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var cardButtons: [CardButton]!
    
    @IBAction func dealMoreButton(_ sender: Any) {
        game.deal()
        updateViewFromModel()
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = SetGame(maxCardCount: cardButtons.count)
        initButtons()
        updateViewFromModel()
    }
    
    @IBAction func touchButton(_ sender: CardButton) {
        if let cardIndex = cardButtons.index(of: sender) {
            game.selectCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    @IBAction func highlightSetIfPossible(_ sender: BorderButton) {
        if let hintCardsIndices = game.giveHint() {
            for index in hintCardsIndices {
                let button = cardButtons[index]
                let prevColor = button.borderColor
                button.borderColor = #colorLiteral(red: 0.8615535798, green: 0.7588004505, blue: 0.3164197836, alpha: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    button.borderColor = prevColor
                    self.updateViewFromModel()
                }
            }
        }
    }
    
    @IBOutlet weak var deckLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private func initButtons() {
        for button in cardButtons {
            button.backgroundColor = nil
            button.setAttributedTitle(nil, for: .normal)
            button.borderColor = UIColor.clear
            button.isEnabled = false
        }
    }
    
    private func updateViewFromModel() {
        deckLabel.text = String(game.deck.cards.count)
        scoreLabel.text = String(game.score)
        initButtons()
        updateButtonsFromModel()
        if game.selectedCards.count == 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.game.removeSet()
                self.updateViewFromModel()
            }
        }
    }
    
    private func updateButtonsFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            if index < game.cardsOnTable.count {
                if game.selectedCards.contains(where: {$0 == game.cardsOnTable[index]}) {
                    let setCompleted = game.selectedCards.count == 3
                    button.initButton(card: game.cardsOnTable[index], selected: true, completed: setCompleted, matched: game.isSet)
                } else {
                    button.initButton(card: game.cardsOnTable[index])
                }
            }
            
        }
    }
    
    
    
}
