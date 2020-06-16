//
//  FPGamePageVC.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

class FPGamePageVC: UIViewController {
    
    @IBOutlet weak var miaoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var middleVc: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    
    @IBOutlet weak var onek: UILabel!
    @IBOutlet weak var twoK: UILabel!
    @IBOutlet weak var threeK: UILabel!
    @IBOutlet weak var fourK: UILabel!
    @IBOutlet weak var fiveK: UILabel!
    
    @IBOutlet weak var oneV: UILabel!
    @IBOutlet weak var twoV: UILabel!
    @IBOutlet weak var threeV: UILabel!
    @IBOutlet weak var fourV: UILabel!
    @IBOutlet weak var fiveV: UILabel!
    
    var levelNum:NSInteger = 0
    var score:NSInteger = 0
    var timerCount:NSInteger = 120
    var timer:Timer!
    var currentVaule:NSInteger = 0
    var currentAnswer:NSInteger = 0
    
    var player1:AVAudioPlayer? = nil
    var player2:AVAudioPlayer? = nil
    
    lazy var sandwichArr:NSMutableArray = {
        let sandwich = NSMutableArray(array:["Cheese sandwich",
                                            "Bacon, lettuce and ketchup sandwich",
                                            "Tuna fish sandwich",
                                            "Roast beef sandwich",
                                            "Super club sandwich"])
        return sandwich
    }()
    lazy var barbecueArr:NSMutableArray = {
        let barbecue = NSMutableArray(array:["Hamburg",
                                            "Bacon eggs",
                                            "The steak",
                                            "A hot dog",
                                            "The Fried chicken"])
        return barbecue
    }()
    lazy var snacksArr:NSMutableArray = {
        let snacks = NSMutableArray(array:["French fries",
                                            "Onion rings",
                                            "Cabbage salad",
                                            "salad",
                                            "soup"])
        return snacks
    }()
    lazy var drinksArr:NSMutableArray = {
        let drinks = NSMutableArray(array:["Soda water",
                                            "Lemon juice",
                                            "tea",
                                            "coffee",
                                            "A milkshake"])
        return drinks
    }()
    lazy var cakeArr:NSMutableArray = {
        let cake = NSMutableArray(array:["The egg yolk pie",
                                        "sundae",
                                        "The cake",
                                        "Daqu",
                                        "Grapes bread"])
        return cake
    }()
    

    init(lever:NSInteger) {
        super.init(nibName: nil, bundle: nil)
        self.levelNum = lever
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setfont()
        changgeState()
    
        let howtoVC:FPHowToPalyPage = FPHowToPalyPage()
        self.yc_bottomPresent(howtoVC, presentedHeight: UIScreen.main.bounds.size.height, completeHandle:nil)
        howtoVC.start = {()
            self.random()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerChange), userInfo: nil, repeats: true)
        }
    }
}

extension FPGamePageVC {
    @objc private func timerChange(){
        
        if self.timerCount < 0 {
            self.timerCount = 0
        }
        
        if self.timerCount == 0  {
    
            timer.invalidate()
            timer = nil
            timerCount = 0
            
            record()
            let over:FPGameOverPageVC = FPGameOverPageVC(score: score)
            self.yc_bottomPresent(over, presentedHeight: UIScreen.main.bounds.size.height, completeHandle: nil)

            over.home = {()
                self.navigationController?.popToRootViewController(animated: true)
            }
            over.again = {()
                
                self.timerCount = 120
                self.score = 0
                self.currentVaule = 0
                self.currentAnswer = 0
                self.changgeState()
                self.random()
            
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerChange), userInfo: nil, repeats: true)
            }
            
        } else {
        
            timerCount = timerCount - 1
            self.miaoLabel.text = String(format: "%ds", timerCount)
        }
    }
}

extension FPGamePageVC {
    @objc private func playerRight(){
        let url:NSURL = Bundle.main.url(forResource: "food_right.mp3", withExtension: nil)! as NSURL
        do{
           player1 = try AVAudioPlayer(contentsOf: url as URL)
        }catch let error as NSError {
           print(error.description)
        }
        player1?.play()
    }
    @objc private func playerWronge(){
        let url:NSURL = Bundle.main.url(forResource: "food_wrong.mp3", withExtension: nil)! as NSURL
        do{
           player2 = try AVAudioPlayer(contentsOf: url as URL)
        }catch let error as NSError {
           print(error.description)
        }
        player2?.play()
    }
}

extension FPGamePageVC {
    @objc private func setfont(){
        miaoLabel.font = UIFont(name: FontName, size: 24)
        titleLabel.font = UIFont(name: FontName, size: 24)
        middleVc.font = UIFont(name: FontName, size: 18)
        bottomLabel.font = UIFont(name: FontName, size: 15)
        
        self.onek.font = UIFont(name: FontName, size: 15)
        self.twoK.font = UIFont(name: FontName, size: 15)
        self.threeK.font = UIFont(name: FontName, size: 15)
        self.fourK.font = UIFont(name: FontName, size: 15)
        self.fiveK.font = UIFont(name: FontName, size: 15)
        
        self.oneV.font = UIFont(name: FontName, size: 24)
        self.twoV.font = UIFont(name: FontName, size: 24)
        self.threeV.font = UIFont(name: FontName, size: 24)
        self.fourV.font = UIFont(name: FontName, size: 24)
        self.fiveV.font = UIFont(name: FontName, size: 24)
        
        self.btnOne.titleLabel?.font = UIFont(name: FontName, size: 18)
        self.btnTwo.titleLabel?.font = UIFont(name: FontName, size: 18)
        self.btnThree.titleLabel?.font = UIFont(name: FontName, size: 18)
    }
}

extension FPGamePageVC {
    
    @objc private func changgeState(){
        self.navigationItem.title = String(format: "%d", score)
        self.miaoLabel.text = String(format: "%ds", timerCount)
    }

    @IBAction func oneAction(_ sender: Any) {
        if self.currentVaule == 1 {
            self.playerRight()
            self.score = self.score + 100
        }else{
            self.playerWronge()
            self.timerCount = self.timerCount - 5
        }
        changgeState()
        random()
    }
    @IBAction func twoAction(_ sender: Any) {
        if self.currentVaule == 2 {
            self.playerRight()
            self.score = self.score + 100
        }else{
            self.playerWronge()
            self.timerCount = self.timerCount - 5
        }
        changgeState()
        random()
    }
    @IBAction func threeAction(_ sender: Any) {
        if self.currentVaule == 3 {
            self.playerRight()
            self.score = self.score + 100
        }else{
            self.playerWronge()
            self.timerCount = self.timerCount - 5
        }
        changgeState()
        random()
    }
}

extension FPGamePageVC {
    
    @objc private func random(){
        randomKey()
        randomVaule()
    }
    
    @objc private func randomKey(){
        var arr:NSMutableArray?
        let index = NSString.getRandomNumber(0, to: 4)
        if index == 0 {
            arr = sandwichArr
        }else if index == 1 {
            arr = barbecueArr
        }else if index == 2 {
            arr = snacksArr
        }else if index == 3 {
            arr = drinksArr
        }else if index == 4 {
            arr = cakeArr
        }
        self.onek.text = arr?[0] as? String
        self.twoK.text = arr?[1] as? String
        self.threeK.text = arr?[2] as? String
        self.fourK.text = arr?[3] as? String
        self.fiveK.text = arr?[4] as? String
    }
    @objc private func randomVaule(){
        if levelNum == 0 {
            randomVauleSim()
        }else if levelNum == 1 {
            randomVauleGen()
        }else {
            randomVauleDif()
        }
    }
    
    @objc private func randomVauleSim(){
    
        let xishu:NSInteger = NSString.getRandomNumber(1, to: 9)
        let start:NSInteger = NSString.getRandomNumber(10, to: 50)
        
        let one:NSInteger = start
        let two:NSInteger = one + xishu
        let three:NSInteger = two + xishu
        let four:NSInteger = three + xishu
        let five:NSInteger = four + xishu
        
        let question:NSInteger = NSString.getRandomNumber(1, to: 5)
        
        if question == 1 {
            
            self.oneV.text = "?"
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = one
             
        }else if question == 2 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = "?"
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = two
            
        }else if question == 3 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = "?"
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = three
            
        }else if question == 4 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = "?"
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = four
            
        }else{
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = "?"
            self.currentAnswer = five
        }
        
        // setBtnText
        let btnIndex:NSInteger = NSString.getRandomNumber(1, to: 3)
        self.currentVaule = btnIndex
        if btnIndex == 1 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else if btnIndex == 2 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else {
            btnOne.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
        }
    }
    
    @objc private func randomVauleGen(){
        
        let xishu:NSInteger = NSString.getRandomNumber(1, to: 9)
        let start:NSInteger = NSString.getRandomNumber(50, to: 85)
        
        let one:NSInteger = start
        let two:NSInteger = one - xishu
        let three:NSInteger = two - xishu
        let four:NSInteger = three - xishu
        let five:NSInteger = four - xishu
        
        let question:NSInteger = NSString.getRandomNumber(1, to: 5)
        
        if question == 1 {
            
            self.oneV.text = "?"
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = one
             
        }else if question == 2 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = "?"
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = two
            
        }else if question == 3 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = "?"
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = three
            
        }else if question == 4 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = "?"
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = four
            
        }else{
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = "?"
            self.currentAnswer = five
        }
        
        // setBtnText
        let btnIndex:NSInteger = NSString.getRandomNumber(1, to: 3)
        self.currentVaule = btnIndex
        if btnIndex == 1 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else if btnIndex == 2 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else {
            btnOne.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
        }
    }
    
    @objc private func randomVauleDif(){
        
        let type:NSInteger = NSString.getRandomNumber(1, to: 2)
    
        var one:NSInteger = 0
        var two:NSInteger = 0
        var three:NSInteger = 0
        var four:NSInteger = 0
        var five:NSInteger = 0
        
        if type == 1 {
            
            let xishu:NSInteger = NSString.getRandomNumber(1, to: 5)
            let start:NSInteger = NSString.getRandomNumber(10, to: 50)
            
            one = start
            two = one + xishu
            three = two + xishu + 1
            four = three + xishu + 2
            five = four + xishu + 3
            
        }else{
            
            let xishu:NSInteger = NSString.getRandomNumber(1, to: 5)
            let start:NSInteger = NSString.getRandomNumber(51, to: 80)
            
            one = start
            two = one - xishu
            three = two - xishu - 1
            four = three - xishu - 2
            five = four - xishu - 3
        }
        
        
        let question:NSInteger = NSString.getRandomNumber(1, to: 5)
        
        if question == 1 {
            
            self.oneV.text = "?"
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = one
             
        }else if question == 2 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = "?"
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = two
            
        }else if question == 3 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = "?"
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = three
            
        }else if question == 4 {
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = "?"
            self.fiveV.text = String(format: "$%d", five)
            self.currentAnswer = four
            
        }else{
            
            self.oneV.text = String(format: "$%d", one)
            self.twoV.text = String(format: "$%d", two)
            self.threeV.text = String(format: "$%d", three)
            self.fourV.text = String(format: "$%d", four)
            self.fiveV.text = "?"
            self.currentAnswer = five
        }
        
        // setBtnText
        let btnIndex:NSInteger = NSString.getRandomNumber(1, to: 3)
        self.currentVaule = btnIndex
        if btnIndex == 1 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else if btnIndex == 2 {
            btnOne.setTitle(String(format: "$%d", self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
        }else {
            btnOne.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(6, to: 8)), for: .normal)
            btnTwo.setTitle(String(format: "$%d",self.currentAnswer + NSString.getRandomNumber(1, to: 5)), for: .normal)
            btnThree.setTitle(String(format: "$%d",self.currentAnswer), for: .normal)
        }
        
    }
}


extension FPGamePageVC {
    
    @objc private func record(){
        if levelNum == 0 {
            NSString.saveScore(score, key: "FP_simple")
        }else if levelNum == 1 {
            NSString.saveScore(score, key: "FP_general")
        }else {
            NSString.saveScore(score, key: "FP_difficult")
        }
    }
}
