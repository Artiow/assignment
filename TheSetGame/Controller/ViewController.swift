import UIKit

class ViewController: UIViewController {

    private var game = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // update smth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var cardButtons: [BorderButton]!
    
    @IBAction func DealMoreButton(_ sender: Any) {
        
    }
    
    private func UpdateButtonsFromModel() {
        for index in game.cardsOnTable.indices {
            var button = cardButtons[index]
        }
    }
    
}
