//   
    

import UIKit
import AVFoundation

class CDHomeViewController: UIViewController {
    private var isOpenMusc = true
//    private lazy var gameVC = CDGameViewController.init()
    private lazy var play:AVAudioPlayer? = {()-> AVAudioPlayer? in
        do {
                let play = try AVAudioPlayer.init(contentsOf: Bundle.main.url(forResource: "Backgroundmusic.mp3", withExtension: nil)!)
                play.prepareToPlay()
                play.numberOfLoops = -1
                return play
            } catch  {
                print("'")
            }
            
            return nil
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        play?.play()
        
    }

    @IBAction private func goIntroduction(_ sender: Any) {
        navigationController?.pushViewController(CDIntroductionViewController(), animated: true)
    
    }
    
    @IBAction private func switchMusic(_ sender: Any) {
        isOpenMusc = !isOpenMusc
        if isOpenMusc{
            play?.play()
             (sender as! UIButton).setImage(UIImage.init(named: "music_1"), for: .normal)
        }else{
            play?.stop()
            (sender as! UIButton).setImage(UIImage.init(named: "music"), for: .normal)
        }
    
//        do {
//              let play = try AVAudioPlayer.init(contentsOf: Bundle.main.url(forResource: "yunshi.mp3", withExtension: nil)!)
//              play.prepareToPlay()
//              play.numberOfLoops = -1
//              return play
//          } catch  {
//              print("'")
//          }
              
    
    }
    
    @IBAction func playEasyGame(_ sender: Any) {
        navigationController?.pushViewController(CDGameViewController.init(), animated: true)
    }
    
    @IBAction private func playHardGame(_ sender: Any) {
        let gameVc = CDGameViewController.init()
        gameVc.isEasyGame = false
        navigationController?.pushViewController(gameVc, animated: true)
    }
    
    @IBAction private func clickRanking(_ sender: Any) {
        navigationController?.pushViewController(CDRankingViewController.init(), animated: true)
    }
}
