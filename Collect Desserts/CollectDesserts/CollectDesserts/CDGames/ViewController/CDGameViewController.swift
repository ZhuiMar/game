//   
   

import UIKit
import AVFoundation

class CDGameViewController: UIViewController {
    var isEasyGame = true
    private var gameTime:Int = 60
    private var intervals:Double = 5
    private var executionTimes = 0
    private var fractionNumber :Int = 0
    private let imageNumber = 10
    private let completeImageNames = ["dessert_1","dessert_2","dessert_3","dessert_4","dessert_5","dessert_6"]
    private var imageNames:[String]?
    private var runningDessers:[Desser] = []
    private var slectedImageName:[String] = []
    
    private var desserModel:CDDesserModel?
    private var imageViews:[CDImageView] = []
    @IBOutlet var dessertButtons: [UIButton]!
    private var timer : Timer?
    
    @IBOutlet weak private var terminationLine: UILabel!
    @IBOutlet weak private var timeLeft: UILabel!
    @IBOutlet weak private var number: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let description = CDDescriptionViewController.init()
        description.modalPresentationStyle = .fullScreen
        description.isEasyGame = isEasyGame
        self.present(description, animated: false, completion: nil)
        description.clicGot = starGame
        
        for _ in 0..<imageNumber{
            let image = CDImageView.init(frame: CGRect.init(x: 0, y: -65, width: 80, height: 65))
            view.addSubview(image)
            imageViews.append(image)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(enterBackground), name: UIApplication.didEnterBackgroundNotification , object: nil)

    }
    
    
    deinit {
        print("====deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func enterBackground(){
        navigationController?.popViewController(animated: false)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopGame()
    }
    
    func starGame() {
        imageNames = completeImageNames[randomPick: 4]
        runningDessers.removeAll()
        gameTime = 60
        intervals = 5
        executionTimes = 0
        fractionNumber = 0
        desserModel = CDDesserModel.init(imageNames: imageNames!, desserNumber: imageNumber)
        for i in imageNames!.indices {
            dessertButtons[i].setImage(UIImage.init(named: imageNames![i]), for: .normal)
            dessertButtons[i].setTitle(imageNames![i], for: .normal)
        }
        setUpUIview()
        startTimer()
    }
    
    func stopGame() {
        stopTimer()
        for i in imageViews.indices{
            imageViews[i].layer.removeAllAnimations()
            imageViews[i].frame.origin.y  = -65
        }
    }
    

    @IBAction func goBackHome(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func downDessert(_ sender: Any) {
        if !isEasyGame{
            let imagename = (sender as! UIButton).title(for: .normal)!
            if !slectedImageName.contains(imagename){
                slectedImageName.append(imagename)
            }
            print("ggggg\(slectedImageName)")
        }
      
    
    }
    
    
    
    
    
    @IBAction func clickDessert(_ sender: Any) {
        var haveDesser:Bool = false
        
        if isEasyGame{
            let imagename = (sender as! UIButton).title(for: .normal)!
            for i in runningDessers.indices{
                if !runningDessers[i].isHide && runningDessers[i].imageName == imagename{
                    runningDessers[i].isHide = true
                    desserModel!.dessers[runningDessers[i].indentfier!].isHide = true
                    haveDesser = true
                    break
                }
            }
        }else{
            
            if  !slectedImageName.isEmpty && slectedImageName.count <= 2{
                for i in stride(from: 0, to: runningDessers.count, by: 2){

                    if !runningDessers[i].isHide {

//                        slectedImageName.contains(runningDessers[i].imageName!)
                        if runningDessers[i+1].isHide {
                            if slectedImageName.count == 1 && runningDessers[i].imageName == slectedImageName[0]{
                                haveDesser = true
                                runningDessers[i].isHide = true
                                desserModel!.dessers[runningDessers[i].indentfier!].isHide = true
                                break
                            }

                        }else if slectedImageName.contains(runningDessers[i].imageName!) && slectedImageName.contains(runningDessers[i+1].imageName!){
                            haveDesser = true
                            runningDessers[i].isHide = true
                            desserModel!.dessers[runningDessers[i].indentfier!].isHide = true
                            runningDessers[i+1].isHide = true
                            desserModel!.dessers[runningDessers[i+1].indentfier!].isHide = true
                            break
                        }

                    }
                }
                
                
            }
            if slectedImageName.isEmpty{
                return
            }
            
            slectedImageName.removeAll()
        }
        
       
    
        let musicName:String?
        if !haveDesser{
            gameTime -= 3
            gameTime = gameTime <= 0 ? 0 : gameTime
            musicName = "error.mp3"
        }else{
            fractionNumber += 1
            musicName = "right.mp3"
        }
        
        var soundID : SystemSoundID = 0
        guard let fileURL = Bundle.main.url(forResource: musicName!, withExtension: nil) else { return }
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        AudioServicesPlaySystemSoundWithCompletion(soundID, nil)
        setUpUIview()
    }

   


    func setUpUIview(){
        
        if gameTime <= 0{
//            stopGame()
            let gameover = CDGameoverViewController.init()
            gameover.inEasyGame = self.isEasyGame ? true : false
            gameover.fractionNumber = fractionNumber
            gameover.modalPresentationStyle = .fullScreen
            gameover.goBackDoSomthing = { (str:String) in
                if str == "home"{
                    self.navigationController?.popViewController(animated: false)
                    print("fanhuihome")
                }else{
                    self.starGame()
                }
            }
            self.present(gameover, animated: true, completion: nil)
            
        }
        
        for i in 0..<imageNumber{
            imageViews[i].setUpView(desser: desserModel!.dessers[i])
        }
        self.timeLeft.text = "\(gameTime)s"
        self.number.text = "x\(fractionNumber)"
    }

}







extension CDGameViewController{
    func startTimer() {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updataSecond), userInfo: nil, repeats: true)
            if timer != nil {RunLoop.current.add(timer!, forMode: .common)}
//            timer!.fire()
        }
    }

    func stopTimer() {
        if timer != nil {
            timer!.invalidate()
            timer = nil
         }
     }

    @objc func updataSecond() {
        if executionTimes%3 == 0{
            if fractionNumber <= 30 {
                intervals = 5 - Double(fractionNumber/10) * 0.5
                print(intervals)
            }
            let wight = self.view.bounds.width
            if isEasyGame{
                imageViews[(executionTimes/3)%imageNumber].frame.origin.x = [20,wight/2-80/2,wight-20-80][3.arc4random]
                desserModel?.dessers[(executionTimes/3)%imageNumber].startAnimation()
                runningDessers.append(desserModel!.dessers[(executionTimes/3)%imageNumber])
                CDGameViewController .ranslationAnimationView(view: imageViews[(executionTimes/3)%imageNumber], duration:intervals, delay: 0, originy: terminationLine.frame.origin.y-65, index: (executionTimes/3)%imageNumber ){(imageIndex) in
                    self.imageViews[imageIndex].frame.origin.y = -65
                    self.desserModel?.dessers[imageIndex].isHide = false
                    self.runningDessers.remove(at: 0)
                }
            }else{
                
                let number = executionTimes/3
                imageViews[2*number%imageNumber].frame.origin.x = wight/2 - 80
                imageViews[2*number%imageNumber+1].frame.origin.x = wight/2
                
                let sss = imageNames![randomPick: 2]
                
                desserModel?.dessers[2*number%imageNumber].imageName = sss[0]
                desserModel?.dessers[2*number%imageNumber+1].imageName = sss[1]
                
                runningDessers.append(desserModel!.dessers[2*number%imageNumber])
                var desss1 = desserModel!.dessers[2*number%imageNumber+1]
                if 10.arc4random < 4 {
                    desss1.isHide = true
                    desserModel?.dessers[2*number%imageNumber+1].isHide = true
                }
                runningDessers.append(desss1)
                

                CDGameViewController .ranslationAnimationView(view: imageViews[2*number%imageNumber], duration:intervals, delay: 0, originy: terminationLine.frame.origin.y-65, index: 2*number%imageNumber ){(imageIndex) in
                     self.imageViews[imageIndex].frame.origin.y = -65
                     self.desserModel?.dessers[imageIndex].isHide = false
                     self.runningDessers.remove(at: 0)

                }
                CDGameViewController .ranslationAnimationView(view: imageViews[2*number%imageNumber+1], duration:intervals, delay: 0, originy: terminationLine.frame.origin.y-65, index: 2*number%imageNumber+1 ){(imageIndex) in
                         self.imageViews[imageIndex].frame.origin.y = -65
                         self.desserModel?.dessers[imageIndex].isHide = false
                         self.runningDessers.remove(at: 0)

                }
            }
            
        }
        executionTimes += 1
        if executionTimes%2 == 0{
            gameTime -= 1
//                if gameTime<=0 {
//                    stopGame()
//                }
        }
        setUpUIview()

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

}
