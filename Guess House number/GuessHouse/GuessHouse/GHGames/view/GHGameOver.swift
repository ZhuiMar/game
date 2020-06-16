//   
   

import UIKit

class GHGameOver: UIView {
    var gameLieve:Gamelevel?
    
    @IBOutlet private var backView: UIView!
    var score :Int = 0{
        didSet{
            scoreNumber.text = String(score)

            updataUI()
        }
    }
    var clickButton : ((String)->Void)?
    
    @IBOutlet private  weak var scoreNumber: UILabel!
    
    @IBOutlet private weak var firstScoreNumber: UILabel!
    
    
    @IBAction func clickAgain(_ sender: Any) {
        if clickButton != nil{
            clickButton!("again")
        }
    
    }
    
    
    @IBAction func clickHome(_ sender: Any) {
        if clickButton != nil{
              clickButton!("home")
          }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView = (Bundle.main.loadNibNamed("GHGameOver", owner: self, options: nil)?.last as! UIView)
        backView.frame = frame
        self.addSubview(backView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func updataUI(){
        var key:String!
        guard gameLieve != nil else {
            return
        }
        
        switch gameLieve!{
        case .simple:
            key = "Simple"
        case .general:
            key = "General"
        case .hard:
            key = "Hard"
        }
        
        let dd = UserDefaults.standard.array(forKey: key)
        if dd != nil{
            var bb:[Int] = dd as! [Int]
            firstScoreNumber.text = "Highest record: \(bb[0])"
            if bb[2] < score {
                bb[2] = score
                bb.sort(by: {(num1, num2) in
                    return num1 > num2
                })
                UserDefaults.standard.setValue(bb, forKey: key )
            }
            
        }else{
            UserDefaults.standard.setValue([score,0,0], forKey: key)
            firstScoreNumber.text = "Highest record: 0"

        }
        
        
    }
    
    
}
