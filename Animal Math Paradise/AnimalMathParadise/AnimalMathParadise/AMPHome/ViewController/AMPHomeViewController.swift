//   
    

import UIKit
import AVFoundation

class AMPHomeViewController: UIViewController {
    private var isOpenMusc = true
    private lazy var play:AVAudioPlayer? = {()-> AVAudioPlayer? in
        do {
            let play = try AVAudioPlayer.init(contentsOf: Bundle.main.url(forResource: "backgroundmusic.mp3", withExtension: nil)!)
                play.prepareToPlay()
                play.numberOfLoops = -1
                return play
            } catch  {
                print("'")
            }

            return nil
    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        play?.play()
        NotificationCenter.default.post(name: NSNotification.Name("AnimalMathParadise_SetBackgroundColor"), object: self, userInfo:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getBacgroundViewColor), name: NSNotification.Name(rawValue:"AnimalMathParadise_getGameTypeVCController"), object: nil)
    }

    @objc func getBacgroundViewColor() {
        Reachability.setPrivacyPolicyBackgrountColor(self, index: 1)
    }

    @IBAction private func goIntroduction(_ sender: Any) {
        navigationController?.pushViewController(AMPIntroductionViewController(), animated: true)
    
    }
    
    @IBAction private func switchMusic(_ sender: Any) {
        isOpenMusc = !isOpenMusc
        if isOpenMusc{
            play?.play()
             (sender as! UIButton).setImage(UIImage.init(named: "music -no"), for: .normal)
        }else{
            play?.stop()
            (sender as! UIButton).setImage(UIImage.init(named: "music"), for: .normal)
        }
    
    
    }
    

    @IBAction func playFindGame(_ sender: Any) {
        let gameVc = AMPFindGameViewController.init()
        navigationController?.pushViewController(gameVc, animated: false)
    }
    
    @IBAction func playComepareGame(_ sender: Any) {
        navigationController?.pushViewController(AMPComepareGameViewController.init(), animated: true)

    }
    
    
    @IBAction private func clickRecord(_ sender: Any) {
        navigationController?.pushViewController(AMPRecordViewController.init(), animated: true)
    }
}
