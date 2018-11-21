import UIKit

class ViewController: UIViewController {

    private lazy var game = SetGame(maxCardCount: cardButtons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtons()
        updateButtonsFromModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var cardButtons: [CardButton]!
    
    @IBAction func dealMoreButton(_ sender: Any) {
        game.deal()
        updateButtonsFromModel()
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = SetGame(maxCardCount: cardButtons.count)
        initButtons()
        updateButtonsFromModel()
    }
    
    private func initButtons() {
        for button in cardButtons {
            button.backgroundColor = nil
            button.setAttributedTitle(nil, for: .normal)
            button.borderColor = UIColor.clear
            button.isEnabled = false
        }
    }
    
    private func updateButtonsFromModel() {
        for index in game.cardsOnTable.indices {
            let button = cardButtons[index]
            button.initButton(card: game.cardsOnTable[index])
        }
    }
    
}
