//
//  FPGameOverPageVC.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

class FPGameOverPageVC: UIViewController {
    
    typealias AgainBlock = () -> Void
    var again: AgainBlock?
    var home: AgainBlock?
    var score:NSInteger = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    init(score:NSInteger) {
        super.init(nibName: nil, bundle: nil)
        self.score = score
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);
        self.scoreLabel.text = String(format: "%d", self.score)
        self.scoreLabel.font = UIFont(name: FontName, size: 36)
    }
    @IBAction func homeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.home!()
    }
    @IBAction func againAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.again!()
    }
}


