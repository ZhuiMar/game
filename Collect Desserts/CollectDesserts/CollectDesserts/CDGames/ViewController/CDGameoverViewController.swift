//   
   

import UIKit

class CDGameoverViewController: UIViewController {
    var inEasyGame : Bool = true
    var fractionNumber :Int =  0
    
    var goBackDoSomthing :((String)-> Void)?
    
    @IBOutlet weak var fraction: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fraction.text = "x\(fractionNumber)"
        let keyString = inEasyGame ? "easyGame" : "hardGame"
        let ss = UserDefaults.standard.array(forKey: keyString)
               if ss != nil {
                   var bb:[Int] = ss as! [Int]
                   if bb[2] < fractionNumber {
                       bb[2] = fractionNumber
                       bb.sort(by: {(num1, num2) in
                           return num1 > num2
                       })
                       UserDefaults.standard.setValue(bb, forKey: keyString )
                   }
                   
                   
               }else{
                   UserDefaults.standard.setValue([fractionNumber,0,0], forKey: keyString)
                   
               }
        
        
    }

    
    @IBAction func clickHomeOrAgian(_ sender: Any) {
        goBackDoSomthing!((sender as! UIButton).title(for: .normal)!)
        self.dismiss(animated: true, completion: nil)
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
