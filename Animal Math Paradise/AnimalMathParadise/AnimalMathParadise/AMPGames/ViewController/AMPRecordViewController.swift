//   
    

import UIKit


class AMPRecordViewController: UIViewController{


    
    @IBOutlet var findaRecord: [UILabel]!
       
    @IBOutlet var comepareRecord: [UILabel]!
   
    deinit {
        print("jjjjjj")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let ss = UserDefaults.standard.array(forKey: "findaRecord")
        let dd = UserDefaults.standard.array(forKey: "comepareRecord")
       
        if ss != nil{
            for i in findaRecord.indices{
                print("11111")
                findaRecord[i].text = "\(ss![i])"
            }
        }
        if dd != nil{
                for i in findaRecord.indices{
                    comepareRecord[i].text = "\(dd![i])"                }
        }
    }


    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    


}
