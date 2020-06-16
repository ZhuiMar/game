//
//  FPHowToPalyPage.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

class FPHowToPalyPage: UIViewController {
    
    typealias StartBlock = () -> Void
    var start: StartBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);
    }
    
    @IBAction func IkonwAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.start!()
    }
}
