//   
    

import UIKit

class CDRankingViewController: UIViewController {

    @IBOutlet var easy: [UILabel]!
       
    @IBOutlet var hard: [UILabel]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ss = UserDefaults.standard.array(forKey: "easyGame")
        let dd = UserDefaults.standard.array(forKey: "hardGame")
       
        if ss != nil{
            for i in easy.indices{
                print("11111")
                easy[i].text = "\(ss![i])"
            }
        }
        if dd != nil{
                for i in easy.indices{
                hard[i].text = "\(dd![i])"                }
        }
    }

    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
