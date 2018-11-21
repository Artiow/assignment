import UIKit

class ViewController: UIViewController {

    private var game = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtons()
        UpdateButtonsFromModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var cardButtons: [CardButton]!
    
    @IBAction func DealMoreButton(_ sender: Any) {
        
    }
    
    private func initButtons() {
        for button in cardButtons {
            button.backgroundColor = nil
            button.setTitle(nil, for: .normal)
            button.borderColor = UIColor.clear
            button.isEnabled = false
        }
    }
    
    private func UpdateButtonsFromModel() {
        for index in game.cardsOnTable.indices {
            let button = cardButtons[index]
            button.initButton(card: game.cardsOnTable[index])
        }
    }
    
}
