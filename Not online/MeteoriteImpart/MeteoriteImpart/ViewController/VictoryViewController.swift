//
//  VictoryViewController.swift
//  MeteoriteImpart
//
//  Created by Mac on 2020/4/23.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit



class VictoryViewController: UIViewController {
    
    var guanshu1 :Int = 0
    var guanshu22:SwiftClosure?

    @IBOutlet weak var guanshu: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.guanshu.text = "\(guanshu1)"
        let ss = UserDefaults.standard.array(forKey: "level")
        if ss != nil {
            var bb:[Int] = ss as! [Int]
            if bb[2] < guanshu1 {
                bb[2] = guanshu1
                bb.sort(by: {(num1, num2) in
                    return num1 > num2
                })
                UserDefaults.standard.setValue(bb, forKey: "level" )
            }
            
            
        }else{
            UserDefaults.standard.setValue([guanshu1,0,0], forKey: "level")
            
        }
    }
    
    @IBAction func gohome(_ sender: Any) {
        if guanshu22 != nil {
            guanshu22!("gohome")
        }
        self.dismiss(animated: true) {
            
        }
        
    }
    
    @IBAction func nextFunc(_ sender: Any) {
        self.dismiss(animated: true) {
            if self.guanshu22 != nil {
                self.guanshu22!("next")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
