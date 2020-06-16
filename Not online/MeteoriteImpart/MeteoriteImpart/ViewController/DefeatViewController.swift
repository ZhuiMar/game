//
//  DefeatViewController.swift
//  MeteoriteImpart
//
//  Created by Mac on 2020/4/23.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit


class DefeatViewController: UIViewController {
    
    var defeat:SwiftClosure?
    var guanshu :Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ss = UserDefaults.standard.array(forKey: "level")
        if ss != nil {
            var bb:[Int] = ss as! [Int]
            if bb[2] < guanshu! {
                bb[2] = guanshu!
                bb.sort(by: {(num1, num2) in
                    return num1 > num2
                })
                UserDefaults.standard.setValue(bb, forKey: "level" )
            }
          
            
        }else{
            UserDefaults.standard.setValue([guanshu!,0,0], forKey: "level")
            
        }
       
    }
    
    @IBAction func goHome(_ sender: Any) {
        if defeat != nil {
            defeat!("gohome")
        }
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func again(_ sender: Any) {
        self.dismiss(animated: true) {
            if self.defeat != nil {
                self.defeat!("again")
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
