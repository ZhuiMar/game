//   
   

import UIKit

class CDImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    
    func setUpView(desser:Desser){
        self.isHidden = desser.isHide
        self.image = UIImage.init(named: desser.imageName! )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
