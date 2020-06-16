//   


import UIKit
import AVFoundation

class AMPComepareGameViewController: UIViewController {
    
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var liftStackView: [UIStackView]!
    
    @IBOutlet var liftAnimalImage: [UIImageView]!
  
    @IBOutlet var rightAnimalImage: [UIImageView]!
    @IBOutlet var rightStackView: [UIStackView]!
    
    @IBOutlet var liveimages: [UIImageView]!
    
    @IBOutlet var numberButtons: [UIButton]!
    
    private lazy var alertController = UIAlertController(title: "You are great!", message: nil, preferredStyle: .alert)
    
    private lazy var gameOVerVC = { () -> AMPGameOverViewController in
        let gameVC = AMPGameOverViewController()
        gameVC.clickButton = clickGameOverButton(buttonTitle:)
        gameVC.modalPresentationStyle = .overCurrentContext
        return gameVC
    }()
    
    private lazy var comepareModel:AMPRecordGameModel = AMPRecordGameModel()
    
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
        let keyString = "comepareRecord"
        
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
        
        removeStackSubview()
        comepareModel.changeAnimals()
        stackViewAddView()
    }
    
    func removeStackSubview() {
        for i in 0..<9{
            
            liftAnimalImage[i].image = nil
            rightAnimalImage[i].image = nil
            
        }
    }
    
    
    func stackViewAddView(){
        
        for i in 0..<comepareModel.animalNumber![0]{
            liftAnimalImage[i].image = UIImage.init(named: comepareModel.animals![0])
        }
        for i in 0..<comepareModel.animalNumber![1]{
            rightAnimalImage[i].image = UIImage.init(named: comepareModel.animals![1])
           
        }
    
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
        
        if comepareModel.result == number {
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
        
    
    }
}
