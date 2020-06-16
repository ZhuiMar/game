//
//  LevelViewController.swift
//  MeteoriteImpart
//
//  Created by sun on 2020/4/18.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

enum outinid {
    case endless
    case levelmoad
}

class LevelViewController: UIViewController {
    
    let audio = AudioHelper.sharedAudio
    var CorrectNumber:Int = 0
    var inCorrectNumber:Int = 0
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet var numberButton: [UIButton]!
    
    var inview :outinid?
    var indentfel : String?
    var buttons :[UIButton] = [UIButton]()
    var onlyOne = 1
    
    let jinaju:CGFloat = 100
    var orangeY:CGFloat?
    var duration:TimeInterval = 20
    
    
    lazy var huoXing = HuoXing(number:self.buttons.count)
    
    var clikNumber:Int = 0{
        
        willSet{
            if inCorrectNumber<3{
//                for button in numberButton{
//                    button.isEnabled = false
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:{
//                        button.isEnabled = true
//                    })
//                }
                self.panduanZi(value: newValue)
            }
        }
    }
    
    
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var earehImage: UIImageView!
    @IBOutlet weak var titleIOne: UILabel!
    
    @IBOutlet weak var titelT: UILabel!
    
    @IBOutlet weak var xingOne: UIImageView!
    
    @IBOutlet weak var xingT: UIImageView!
    
    deinit {
       print("xiaohui")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inview = indentfel == "levelmoad" ?  outinid.levelmoad : outinid.endless
        
        let tip:TiShiViewController = TiShiViewController()
        if #available(iOS 13.0, *) {
            tip.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        } else {
            tip.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        }
        self.present(tip, animated: true) {
            
        }
        
        tip.okAction = {()
            print("=======jkhjkkjl")
            if self.onlyOne == 1 {
                self.addButtons()
                self.onlyOne = 0
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        if onlyOne == 1 {
//            addButtons()
//            onlyOne = 0
//        }
    }
    
    
    func jixuyouxi() {
       
        huoXing = HuoXing.init(number: buttons.count)
        inCorrectNumber = 0
        for i in buttons.indices{
            buttons[i].isHidden = false
            buttons[i].frame.origin.y = orangeY!
            let sss = duration/Double(buttons.count)
            self.openAnimate(view: buttons[i],delay: sss *  Double(i) ,atindex: Int(i))
        }
        upButtonsView()
    }
    
    
    func addButtons() {
        
        let aa = self.backImage.bounds.width
        let height:CGFloat = 62
        let width:CGFloat = 110.0
        let sss = [20.0, aa/2-width/2, aa-width-20.0]
        let number = earehImage.frame.origin.y/(height+jinaju)+1
        orangeY = earehImage.frame.origin.y-number*(height+jinaju)+jinaju
        for _ in 0...Int(number){
            let orangeX = sss[Int(arc4random_uniform(UInt32(sss.count)))]
            let dd:UIButton = UIButton.init(frame: CGRect.init(x: orangeX, y: orangeY!, width: width, height: height))
            dd.titleLabel?.isHidden = false
            dd.titleLabel?.font = UIFont.init(name: "SegoePrint", size: 20)
            dd.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1), for: .normal)
            dd.isUserInteractionEnabled = false
            dd.setBackgroundImage(UIImage.init(named: "meteorite"), for:.normal)
            dd.layer.borderColor = UIColor.red.cgColor
            dd.layer.cornerRadius = 15
            self.view.addSubview(dd)
            buttons.append(dd)
        }
        upButtonsView()

        for i in buttons.indices{
            
            let sss = duration/Double(buttons.count)
            self.openAnimate(view: buttons[i],delay: sss *  Double(i) ,atindex: Int(i))
        }
    }
    
    func openAnimate(view:UIView, delay:TimeInterval, atindex:Int) {
        
        LevelViewController.ranslationAnimationView(view:view, duration: duration, delay: delay ,originy: earehImage.frame.origin.y-62 ,index: atindex) { (indes) in

            if !self.huoXing.huoQius[indes].isHide{
                self.audio.playAudio("zhuangji.mp3")
                self.inCorrectNumber += 1
                self.hideSelectedHuoXing()
            }
            view.frame.origin.y = self.orangeY!
            self.huoXing.huoQius[indes].isHide = false
            self.upButtonsView()
            if self.inCorrectNumber < 3{
                self.openAnimate(view: view ,delay: 0 ,atindex: indes)
            }else{
                self.gameOver()
            }

        }

    }
    
    func gameOver() {

        for i in buttons.indices{
            buttons[i].layer.removeAllAnimations()
            buttons[i].isHidden = true
        }

        if inview! == .endless{
            self.performSegue(withIdentifier: "showGameOver", sender: CorrectNumber)
            
        }else{
             self.performSegue(withIdentifier: "showDefeat", sender: CorrectNumber  )
        }
        CorrectNumber = 0
        duration = 20
    }
    
    func victory() {
        for i in buttons.indices{
            buttons[i].layer.removeAllAnimations()
            buttons[i].isHidden = true
        }
         self.performSegue(withIdentifier: "showVictory", sender: CorrectNumber)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier! == "showGameOver" {
            let ss:GameOverViewController = segue.destination as! GameOverViewController
            ss.fenshu1 = sender as! Int
            ss.fenshu22={(String) in
                if  String == "gohome"{
                    self.navigationController?.popToRootViewController(animated: false)
                }else{
                    self.jixuyouxi()
                }
                
            }
        }else if segue.identifier! == "showVictory"{
            let ss:VictoryViewController = segue.destination as! VictoryViewController
            ss.guanshu1 = (sender as! Int)/20
            ss.guanshu22 = {(String) in
                if  String == "gohome"{
                    self.navigationController?.popToRootViewController(animated: false)
                }else{
                   self.jixuyouxi()
                }
            }
        }else if segue.identifier! == "showDefeat"{
            let ss:DefeatViewController = segue.destination as! DefeatViewController
            ss.guanshu = (sender as! Int)/20
            ss.defeat = {(String) in
                if  String == "gohome"{
                    self.navigationController?.popToRootViewController(animated: false)
                }else{
                    self.CorrectNumber = 0
                    self.jixuyouxi()
                }
            }
        }
    }
   
    
    class func ranslationAnimationView(view:(UIView) ,duration:(TimeInterval),delay:(TimeInterval),originy:CGFloat, index:Int, completion:((Int)-> Void)? = nil){
        UIView.animate(withDuration: duration, delay: delay, options: .curveLinear, animations: {
            view.frame.origin.y = originy
        }) { (finished) in
            if finished{
                completion!(index)
            }
        }
    }
    
    
    func upButtonsView(){
        for i in buttons.indices{
            let huoqou:HuoQiu = self.huoXing.huoQius[i]
            print(huoqou.shuZu)
            buttons[i].setTitle("\(huoqou.shuZu[0])+\(huoqou.shuZu[1])+?=\(huoqou.shuZu[0]+huoqou.shuZu[1]+huoqou.shuZu[2])", for: .normal)
            buttons[i].isHidden = huoqou.isHide
            buttons[i].layer.borderWidth = huoqou.isSelct ? 2 : 0
           
        }
        
        switch inview! {
        case .endless:
            titleIOne.text = "\(CorrectNumber)"
            titelT.text = ""
        case .levelmoad:
            titelT.text = "\(CorrectNumber%20)/20"
        }
        xingOne.image = inCorrectNumber>=1 ? UIImage.init(named: "heart_1") : UIImage.init(named: "heart")
        xingT.image = inCorrectNumber>=2 ? UIImage.init(named: "heart_1") : UIImage.init(named: "heart")
    }
    
    @IBAction func goToHome(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
    
        self.clikNumber = 1
    }
    
    @IBAction func button2(_ sender: Any) {
        self.clikNumber = 2
    }
    
    @IBAction func button3(_ sender: Any) {
        self.clikNumber = 3
    }
    
    @IBAction func button4(_ sender: Any) {
        self.clikNumber = 4
    }
    
    @IBAction func button5(_ sender: Any) {
        self.clikNumber = 5
    }
    
    @IBAction func button6(_ sender: Any) {
        self.clikNumber = 6
    }
    
    @IBAction func button7(_ sender: Any) {
        self.clikNumber = 7
    }
    
    @IBAction func button8(_ sender: Any) {
        self.clikNumber = 8
    }
    
    @IBAction func button9(_ sender: Any) {
        self.clikNumber = 9
    }

    func hideSelectedHuoXing() {
        huoXing.hideSlectedHuoXing()
    }
    
    func panduanZi(value:Int){
        if buttons[huoXing.selectedIndex].isHidden{
            print("T##items: Any...##Any")
            return
        }
        if huoXing.isCorrectResult(value){
            audio.playAudio("dadui.mp3")
            CorrectNumber += 1
            upButtonsView()
            if inview! == .levelmoad{
                if CorrectNumber%20 == 0{
                    victory()
                }
            }
        }else{
            audio.playAudio("cuomu.mp3")
        }
    }
    
    
}

