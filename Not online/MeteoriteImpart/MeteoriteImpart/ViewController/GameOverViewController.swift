//
//  GameOverViewController.swift
//  MeteoriteImpart
//
//  Created by Mac on 2020/4/23.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

typealias SwiftClosure = (String) -> Void


class GameOverViewController: UIViewController {
    
    var  fenshu1 :Int = 0
    
    var fenshu22:SwiftClosure?
    
    
    @IBOutlet weak var fenshu: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fenshu.text = "\(fenshu1)"
        // Do any additional setup after loading the view.
        
        let ss = UserDefaults.standard.array(forKey: "endle")
      
            if ss != nil {
                var bb:[Int] = ss as! [Int]
                if bb[2] < fenshu1 {
                    bb[2] = fenshu1
                    bb.sort(by: {(num1, num2) in
                        return num1 > num2
                    })
                    UserDefaults.standard.setValue(bb, forKey: "endle" )
                }
              
                
            }else{
                UserDefaults.standard.setValue([fenshu1,0,0], forKey: "endle")
                
            }
    }
    
    @IBAction func gohome(_ sender: Any) {
        if  fenshu22 != nil{
            fenshu22!("gohome")
        }
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
        self.dismiss(animated: true) {
            if  self.fenshu22 != nil{
                self.fenshu22!("next")
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
