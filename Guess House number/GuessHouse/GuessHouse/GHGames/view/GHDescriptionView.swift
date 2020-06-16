//   
    

import UIKit

class GHDescriptionView: UIView {

    @IBOutlet private var backView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backView = (Bundle.main.loadNibNamed("GHDescriptionView", owner: self, options: nil)?.last as! UIView)
        backView.frame = frame
        self.addSubview(backView)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
