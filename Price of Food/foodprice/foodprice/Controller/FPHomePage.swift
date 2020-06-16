//
//  FPHomePage.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

class FPHomePage: UIViewController {
    
    @IBOutlet weak var musiCBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    var isPlay = true
    var palyer:AVAudioPlayer? = nil
    
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:NSURL = Bundle.main.url(forResource: "food_bg.mp3", withExtension: nil)! as NSURL
        do{
            palyer = try AVAudioPlayer(contentsOf: url as URL)
        }catch let error as NSError {
            print(error.description)
        }
        palyer?.play()
            
    }
    
    @IBAction func simpleAction(_ sender: Any) {
        let game = FPGamePageVC(lever: 0)
        self.navigationController?.pushViewController(game, animated: true)
    }
    @IBAction func generalAction(_ sender: Any) {
        let game = FPGamePageVC(lever: 1)
        self.navigationController?.pushViewController(game, animated: true)
    }
    @IBAction func difficultAction(_ sender: Any) {
        let game = FPGamePageVC(lever: 2)
        self.navigationController?.pushViewController(game, animated: true)
    }
    @IBAction func rankingAction(_ sender: Any) {
        let rank = FPRankingPage()
        self.navigationController?.pushViewController(rank, animated: true)
    }
    @IBAction func musicAction(_ sender: Any) {
        
        if isPlay == true {
            musiCBtn.setBackgroundImage(UIImage(named: "music_on"), for: .normal)
            palyer?.pause()
        }else{
            musiCBtn.setBackgroundImage(UIImage(named: "music_off"), for: .normal)
            palyer?.play()
        }
        isPlay = !isPlay
    }
    @IBAction func aboutAction(_ sender: Any) {
        let about = FPAboutPageVC()
        self.navigationController?.pushViewController(about, animated: true)
    }
}
