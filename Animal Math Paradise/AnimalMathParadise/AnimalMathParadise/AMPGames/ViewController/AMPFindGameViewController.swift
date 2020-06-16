//   
   

import UIKit
import AVFoundation


class AMPFindGameViewController: UIViewController {
   
    @IBOutlet weak var animalStackView: UIStackView!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var findAnimal: UILabel!
    
    @IBOutlet var liveimages: [UIImageView]!
    
    @IBOutlet var numberButtons: [UIButton]!
    
    private lazy var alertController = UIAlertController(title: "You are great!",
                                                       message: nil, preferredStyle: .alert)
    
    private lazy var gameOVerVC = { () -> AMPGameOverViewController in 
        let gameVC = AMPGameOverViewController()
        gameVC.clickButton = clickGameOverButton(buttonTitle:)
        gameVC.modalPresentationStyle = .overCurrentContext
        return gameVC
    }()
    
    private lazy var findModel:AMPFindGameModel = AMPFindGameModel()
    
    private var scoreNumber:Int = 0{
        didSet {
            score.text = String(scoreNumber)
            
        }
    }
    private var liveNumber = 0{
        didSet{
            if liveNumber == 0{
                for item in liveimages {
                    item.image = UIImage.init(named: "life")
                }
            }
           
            for i in 0..<liveNumber{
                liveimages[i].image = UIImage.init(named: "vita")
            }
            if liveNumber >= 3{
               gameOver()
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let ss = AMPDescriptionViewController.init()
        ss.isFindGame = true
        ss.modalPresentationStyle = .overCurrentContext
        self.present(ss, animated: false, completion: nil)
        startGame()
        
    }
    
    
    deinit {
        print("====deinit")
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
        scoreNumber = 0
        liveNumber = 0
        updateView()
    }
    
    func gameOver() {
        gameOVerVC.fenshu = "\(scoreNumber)"
        self.present(gameOVerVC, animated: false, completion: nil)
        let keyString = "findaRecord"
        
        let ss = UserDefaults.standard.array(forKey: keyString)
                      if ss != nil {
                          var bb:[Int] = ss as! [Int]
                          if bb[2] < scoreNumber {
                              bb[2] = scoreNumber
                              bb.sort(by: {(num1, num2) in
                                  return num1 > num2
                              })
                              UserDefaults.standard.setValue(bb, forKey: keyString )
                          }
                          
                          
                      }else{
                          UserDefaults.standard.setValue([scoreNumber,0,0], forKey: keyString)
                          
                      }
    }
    
    func updateView() {
        
        for item in self.numberButtons {
            item.isUserInteractionEnabled = true
            item.setBackgroundImage(UIImage.init(named: "card"), for: .normal)
        }
       
        for subview in animalStackView.subviews{
            subview.removeFromSuperview()
        }
        findModel.changeAnimals()
        for item in findModel.animals!{
          
            let imageView = UIImageView.init(image: UIImage.init(named: item))
            imageView.contentMode = .scaleAspectFit
//            imageView.bounds = CGRect.init(x: 0, y: 0, width: (animalStackView.bounds.width-16)/9, height: animalStackView.bounds.height)
//            imageView.bounds = CGRect.init(x: 0, y: 0, width: 10, height: 10)
//            imageView.backgroundColor = .red
//            imageView.image = UIImage.init(named: item)
            animalStackView.addArrangedSubview(imageView)
        }
        findAnimal.text = "What position is the \(findModel.slectedAnimal!) in?"
   
    }
    
    func clickGameOverButton(buttonTitle:String) {
        if buttonTitle == "again"{
            startGame()
        }else{
            navigationController?.popViewController(animated: true)
        }

    }
    @IBAction func clickNumberButton(_ sender: Any) {
       
        let number = Int((sender as! UIButton).title(for: .normal)!)
        var musicName:String?
        
        if findModel.result == number {
//            (sender as! UIButton).setBackgroundImage(UIImage.init(named: "button"), for: .normal)
            scoreNumber += 10
           
           
            self.present(alertController, animated: true, completion: nil)
       
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
                self.updateView()
            }
            
            musicName = "riAMPt.mp3"
        }else{
            (sender as! UIButton).setBackgroundImage(UIImage.init(named: "card -error"), for: .normal)
            liveNumber += 1
            (sender as! UIButton).isUserInteractionEnabled = false
            musicName = "error.mp3"
        }
        
        var soundID : SystemSoundID = 0
        guard let fileURL = Bundle.main.url(forResource: musicName!, withExtension: nil) else { return }
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        AudioServicesPlaySystemSoundWithCompletion(soundID, nil)
        
//        for item in numberButtons {
//            item.isUserInteractionEnabled = false
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
//            self.updateView()
//            for item in self.numberButtons {
//                item.isUserInteractionEnabled = true
//                item.setBackgroundImage(UIImage.init(named: "card"), for: .normal)
//            }
//        }
    }
}
