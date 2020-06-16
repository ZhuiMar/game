//   
   

import UIKit

class GHRankingView: UIView {
    
    var gameLieve:Gamelevel?{
        didSet{
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
            
            item.text = key
            
            let dd = UserDefaults.standard.array(forKey: key)
            if dd != nil{
                var bb:[Int] = dd as! [Int]
                
                for i in fraction.indices{
                    fraction[i].text = "\(bb[i])"
                }

            }
        }
    }

    @IBOutlet var backView: UIView!
  
    @IBOutlet var fraction: [UILabel]!
    
    @IBOutlet private weak var item: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
         backView = (Bundle.main.loadNibNamed("GHRankingView", owner: self, options: nil)?.last as! UIView)
               backView.frame = frame
               self.addSubview(backView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
