//   
    

import UIKit

class CDDescriptionViewController: UIViewController {
    @IBOutlet private weak var tipImage: UIImageView!
    var isEasyGame:Bool = true
    
    var clicGot:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let imageName = isEasyGame ? "tip1" : "tip2"
        tipImage.image = UIImage.init(named: imageName)
    }

    @IBAction private func clickGotIt(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        if (clicGot != nil){
             clicGot!()
        }
       
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
