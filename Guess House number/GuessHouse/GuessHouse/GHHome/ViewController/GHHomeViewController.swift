//   
    

import UIKit
import AVFoundation

class GHHomeViewController: UIViewController {
    private var isOpenMusc = true
    private lazy var play:AVAudioPlayer? = {()-> AVAudioPlayer? in
        do {
                let play = try AVAudioPlayer.init(contentsOf: Bundle.main.url(forResource: "backMusic.mp3", withExtension: nil)!)
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
        
    }

    @IBAction private func goIntroduction(_ sender: Any) {
        navigationController?.pushViewController(GHIntroductionViewController(), animated: true)
    
    }
    
    @IBAction private func switchMusic(_ sender: Any) {
        isOpenMusc = !isOpenMusc
        if isOpenMusc{
            play?.play()
             (sender as! UIButton).setImage(UIImage.init(named: "turn_off"), for: .normal)
        }else{
            play?.stop()
            (sender as! UIButton).setImage(UIImage.init(named: "open"), for: .normal)
        }
    
    
    }
    
    @IBAction func playGeneral(_ sender: Any) {
        let gameVc = GHGameViewController.init()
        gameVc.gameLever = .general
        navigationController?.pushViewController(gameVc, animated: false)
    }
    
    @IBAction func playEasyGame(_ sender: Any) {
        let gameVc = GHGameViewController.init()
        gameVc.gameLever = .simple
        navigationController?.pushViewController(gameVc, animated: false)
    }
    
    @IBAction private func playHardGame(_ sender: Any) {
        let gameVc = GHGameViewController.init()
        gameVc.gameLever = .hard
        navigationController?.pushViewController(gameVc, animated: false)
    }
    
    @IBAction private func clickRanking(_ sender: Any) {
        navigationController?.pushViewController(GHRankingViewController.init(), animated: true)
    }
}
