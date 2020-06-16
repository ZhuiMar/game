//
//  TiShiViewController.swift
//  MeteoriteImpart
//
//  Created by zy on 2020/4/25.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class TiShiViewController: UIViewController {
    
    typealias OKActionBlock = () -> Void
    var okAction: OKActionBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    @IBAction func okactinon(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.okAction!()
    }
}


