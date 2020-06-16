//   
    

import UIKit

class GHDescriptionViewController: UIViewController {
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let handTap = UITapGestureRecognizer(target: self, action: #selector(funTap))
        self.view.addGestureRecognizer(handTap)
        
        self.tittleLabel.font = UIFont(name: "ChaparralPro-BoldIt", size: 30) 
        self.contentLabel.font = UIFont(name: "ChaparralPro-BoldIt", size: 24)
    }
    
    @objc func funTap(sender: UIPanGestureRecognizer){
        self.dismiss(animated: false, completion: nil)
    }
}
