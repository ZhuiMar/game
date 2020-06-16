//
//  LeadViewController.swift
//  MeteoriteImpart
//
//  Created by sun on 2020/4/18.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class LeadViewController: UIViewController {

    @IBOutlet weak var level1: UILabel!
    @IBOutlet weak var level2: UILabel!
    @IBOutlet weak var level3: UILabel!
    
    @IBOutlet weak var endle1: UILabel!
    @IBOutlet weak var endle2: UILabel!
    @IBOutlet weak var endle3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.duQuBendiShuJu()
        
    }
    

    @IBAction func goToHome(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
   
    func duQuBendiShuJu(){
        let ss = UserDefaults.standard.array(forKey: "level")
        if ss != nil{
            self.level1.text = "Level \(ss![0])"
            self.level2.text = "Level \(ss![1])"
            self.level3.text = "Level \(ss![2])"
            
        }
        let dd = UserDefaults.standard.array(forKey: "endle")
        if dd != nil{
            self.endle1.text = "\(dd![0])"
            self.endle2.text = "\(dd![1])"
            self.endle3.text = "\(dd![2])"
            
        }
        
    }
    
}
