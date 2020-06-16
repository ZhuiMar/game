//
//  FPRankingPage.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

class FPRankingPage: UIViewController {
    
    @IBOutlet weak var simple: UILabel!
    @IBOutlet weak var general: UILabel!
    @IBOutlet weak var difficult: UILabel!
    
    @IBOutlet weak var simOneKey: UILabel!
    @IBOutlet weak var simTwoKey: UILabel!
    @IBOutlet weak var simThreeKey: UILabel!
    
    @IBOutlet weak var genOnekey: UILabel!
    @IBOutlet weak var genTwoKey: UILabel!
    @IBOutlet weak var genThreekey: UILabel!
    
    @IBOutlet weak var diffOneKey: UILabel!
    @IBOutlet weak var diffTwokey: UILabel!
    @IBOutlet weak var diffThreekey: UILabel!
    
    @IBOutlet weak var simOneV: UILabel!
    @IBOutlet weak var simTwoV: UILabel!
    @IBOutlet weak var simThreeV: UILabel!
    
    @IBOutlet weak var genOneV: UILabel!
    @IBOutlet weak var genTwoV: UILabel!
    @IBOutlet weak var genThreeV: UILabel!
    
    @IBOutlet weak var diffOneV: UILabel!
    @IBOutlet weak var diffTwoV: UILabel!
    @IBOutlet weak var diffThreeV: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Ranking"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setFont()
        getRanking()
    }
}

extension FPRankingPage {
    @objc func setFont(){
        simple.font = UIFont(name: FontName, size: 18)
        general.font = UIFont(name: FontName, size: 18)
        difficult.font = UIFont(name: FontName, size: 18)
        
        simOneKey.font = UIFont(name: FontName, size: 18)
        simTwoKey.font = UIFont(name: FontName, size: 18)
        simThreeKey.font = UIFont(name: FontName, size: 18)
        simOneV.font = UIFont(name: FontName, size: 18)
        simTwoV.font = UIFont(name: FontName, size: 18)
        simThreeV.font = UIFont(name: FontName, size: 18)
        
        genOneV.font = UIFont(name: FontName, size: 18)
        genTwoV.font = UIFont(name: FontName, size: 18)
        genThreeV.font = UIFont(name: FontName, size: 18)
        genOnekey.font = UIFont(name: FontName, size: 18)
        genTwoKey.font = UIFont(name: FontName, size: 18)
        genThreekey.font = UIFont(name: FontName, size: 18)
        
        diffOneKey.font = UIFont(name: FontName, size: 18)
        diffTwokey.font = UIFont(name: FontName, size: 18)
        diffThreekey.font = UIFont(name: FontName, size: 18)
        diffOneV.font = UIFont(name: FontName, size: 18)
        diffTwoV.font = UIFont(name: FontName, size: 18)
        diffThreeV.font = UIFont(name: FontName, size: 18)
    }
}

extension FPRankingPage {
    @objc private func getRanking(){
        
        let simpleArr:NSArray = NSString.getRankingKey("FP_simple")! as NSArray
        let generalArr:NSArray = NSString.getRankingKey("FP_general")! as NSArray
        let difficultArr:NSArray = NSString.getRankingKey("FP_difficult")! as NSArray
        
        if simpleArr.count == 0 {
            simOneV.text = "0"
            simTwoV.text = "0"
            simThreeV.text = "0"
        }else if simpleArr.count == 1 {
            let one:NSNumber = simpleArr[0] as! NSNumber
            simOneV.text = String(format: "%d", one.intValue)
            simTwoV.text = "0"
            simThreeV.text = "0"
        }else if simpleArr.count == 2 {
            let one:NSNumber = simpleArr[0] as! NSNumber
            let two:NSNumber = simpleArr[1] as! NSNumber
            simOneV.text = String(format: "%d", one.intValue)
            simTwoV.text = String(format: "%d", two.intValue)
            simThreeV.text = "0"
        }else if simpleArr.count == 3{
            let one:NSNumber = simpleArr[0] as! NSNumber
            let two:NSNumber = simpleArr[1] as! NSNumber
            let three:NSNumber = simpleArr[2] as! NSNumber
            simOneV.text = String(format: "%d", one.intValue)
            simTwoV.text = String(format: "%d", two.intValue)
            simThreeV.text = String(format: "%d", three.intValue)
        } else {
            
        }
        
    
        if generalArr.count == 0 {
            genOneV.text = "0"
            genTwoV.text = "0"
            genThreeV.text = "0"
        }else if generalArr.count == 1 {
            let one:NSNumber = generalArr[0] as! NSNumber
            genOneV.text = String(format: "%d", one.intValue)
            genTwoV.text = "0"
            genThreeV.text = "0"
        }else if generalArr.count == 2 {
            let one:NSNumber = generalArr[0] as! NSNumber
            let two:NSNumber = generalArr[1] as! NSNumber
            genOneV.text = String(format: "%d", one.intValue)
            genTwoV.text = String(format: "%d", two.intValue)
            genThreeV.text = "0"
        }else if generalArr.count == 3 {
            let one:NSNumber = generalArr[0] as! NSNumber
            let two:NSNumber = generalArr[1] as! NSNumber
            let three:NSNumber = generalArr[2] as! NSNumber
            genOneV.text = String(format: "%d", one.intValue)
            genTwoV.text = String(format: "%d", two.intValue)
            genThreeV.text = String(format: "%d", three.intValue)
        }else{
            
        }
        
        if difficultArr.count == 0 {
            diffOneV.text = "0"
            diffTwoV.text = "0"
            diffThreeV.text = "0"
        }else if difficultArr.count == 1 {
            let one:NSNumber = difficultArr[0] as! NSNumber
            diffOneV.text = String(format: "%d", one.intValue)
            diffTwoV.text = "0"
            diffThreeV.text = "0"
        }else if difficultArr.count == 2 {
            let one:NSNumber = difficultArr[0] as! NSNumber
            let two:NSNumber = difficultArr[1] as! NSNumber
            diffOneV.text = String(format: "%d", one.intValue)
            diffTwoV.text = String(format: "%d", two.intValue)
            diffThreeV.text = "0"
        }else if difficultArr.count == 3 {
            let one:NSNumber = difficultArr[0] as! NSNumber
            let two:NSNumber = difficultArr[1] as! NSNumber
            let three:NSNumber = difficultArr[2] as! NSNumber
            diffOneV.text = String(format: "%d", one.intValue)
            diffTwoV.text = String(format: "%d", two.intValue)
            diffThreeV.text = String(format: "%d", three.intValue)
        }else{
            
        }
    
    }
}

