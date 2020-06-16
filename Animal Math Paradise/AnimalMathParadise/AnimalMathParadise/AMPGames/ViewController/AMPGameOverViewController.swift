//   
    

import UIKit

class AMPGameOverViewController: UIViewController {
    var clickButton : ((String)->Void)?
    var fenshu:String?
    @IBOutlet private weak var fenShu: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fenShu.text = fenshu ?? "0"
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonLift(_ sender: Any) {
        if clickButton != nil{
            clickButton!("home")
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func buttonRight(_ sender: Any) {
        if clickButton != nil{
            clickButton!("again")
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}
