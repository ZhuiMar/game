//   
   

import UIKit
import AVFoundation

enum Gamelevel: Int {
      case simple = 0
      case general = 1
      case hard = 2
  }

class GHGameViewController: UIViewController {
   
    @IBOutlet weak var score: UILabel!
    
    private var scoreNumber:Int = 0{
        didSet {
            score.text = String(scoreNumber)

        }
    }
    @IBOutlet weak var addUpHouseNumber: UILabel!
    @IBOutlet weak var housePosition: UILabel!
    
    @IBOutlet var houseImages: [UIImageView]!
    lazy private var gameMode:GHGameModel = GHGameModel.init(allHouseImage: ["1","2","3","4","5","6"], gameLevel: gameLever!)
    
    
    lazy private var gameOverView = { () -> GHGameOver in
        let kkk = GHGameOver.init(frame: self.view.frame)
        kkk.gameLieve = gameLever
        kkk.score = scoreNumber
        kkk.clickButton = clickGameOverButton(buttonTitle:)
        kkk.isHidden = true
        self.view.addSubview(kkk)
        return kkk
    }()
   
    @IBOutlet var houseNumbers: [UIButton]!
   
    @IBOutlet var liveimages: [UIImageView]!
    private var liveNumber = 0{
        didSet{
            if liveNumber == 0{
                for item in liveimages {
                    item.image = UIImage.init(named: "heart")
                }
            }
           
            for i in 0..<liveNumber{
                liveimages[i].image = UIImage.init(named: "heart2")
            }
            if liveNumber >= 3{
                gameOverView.frame = self.view.frame
                gameOverView.isHidden = false
                gameOverView.score = scoreNumber
                
            }
        }
    }
    
    var gameLever :Gamelevel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let ss = GHDescriptionViewController.init()
        ss.modalPresentationStyle = .overCurrentContext
        self.present(ss, animated: false, completion: nil)
//        let back = GHDescriptionView.init(frame: self.view.frame)
//        self.view.addSubview(back)
        startGame()
        
    }
    
    
    deinit {
        print("====deinit")
    }
    
    
    @IBAction func clickHouseNumber(_ sender: Any) {
        let number = Int((sender as! UIButton).title(for: .normal)!)
        let musicName:String?
        if gameMode.houseNumber[number!]! {
            (sender as! UIButton).setBackgroundImage(UIImage.init(named: "button"), for: .normal)
            scoreNumber += 5
            
            musicName = "right.mp3"
        }else{
            (sender as! UIButton).setBackgroundImage(UIImage.init(named: "button2"), for: .normal)
            liveNumber += 1
            musicName = "error.mp3"
        }
        
        var soundID : SystemSoundID = 0
        guard let fileURL = Bundle.main.url(forResource: musicName!, withExtension: nil) else { return }
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        AudioServicesPlaySystemSoundWithCompletion(soundID, nil)
        
        for item in houseNumbers {
            item.isUserInteractionEnabled = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.updateView()
            for item in self.houseNumbers {
                       item.isUserInteractionEnabled = true
                   }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func startGame() {
        gameOverView.isHidden = true
        scoreNumber = 0
        liveNumber = 0
        updateView()
    }
    
    func updateView() {
        guard liveNumber < 3 else {
            return
        }
        gameMode.changeData()
        var keys = Array(gameMode.houseNumber.keys)
        keys.sort()
        for i  in houseNumbers.indices  {
            houseNumbers[i].setTitle(String(keys[i]), for: .normal)
            houseNumbers[i].setBackgroundImage(UIImage.init(named: "button3"), for: .normal)
        
            houseImages[i].image = UIImage.init(named: gameMode.houseImages[i])
        }
        housePosition.text = "What is the \(gameMode.housePosition!) house number?"
        addUpHouseNumber.text = "3 consecutive house numbers add up to \(gameMode.houseSum!)"
   
    }
    
    func clickGameOverButton(buttonTitle:String) {
        if buttonTitle == "again"{
            startGame()
        }else{
            navigationController?.popViewController(animated: true)
        }
        
    }
}
