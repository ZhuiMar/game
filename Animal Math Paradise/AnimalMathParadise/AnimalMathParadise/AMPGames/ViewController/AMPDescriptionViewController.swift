//   
    

import UIKit

class AMPDescriptionViewController: UIViewController {
    
    var  isFindGame:Bool = false
    
  
    @IBOutlet private weak var descripionL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isFindGame{
            descripionL.text = """
            Count from left to right
            where the target animal is,
            click the correct number.
            """
        }
    }

    @IBAction func clickStartButton(_ sender: Any) {
   
        self.dismiss(animated: false, completion: nil)
    }
    
}
