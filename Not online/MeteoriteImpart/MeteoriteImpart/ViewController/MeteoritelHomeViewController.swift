//
//  MeteoritelHomeViewController.swift
//  MeteoriteImpart
//
//  Created by sun on 2020/4/18.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit
import AVFoundation


class MeteoritelHomeViewController: UIViewController {
    
    var openMusic :Bool = true
    
    let audio = AudioHelper.sharedAudio
    var play: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URL = Bundle.main.url(forResource: "yunshi.mp3", withExtension: nil)
        play =  audio.playMusic(audioUrl: URL!) {}
        play?.play()
        
//        self.performSegue(withIdentifier: "TiShiView", sender: nil)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier! == "endless" {
            let ss:LevelViewController = segue.destination as! LevelViewController
            ss.indentfel = segue.identifier
        }else if segue.identifier! == "levelmoad"{
            let ss:LevelViewController = segue.destination as! LevelViewController
            ss.indentfel = segue.identifier
        }
    }
    
    @IBAction func dianJjYingYue(_ sender: Any) {
        openMusic = !openMusic
        audio.openMusic = openMusic
        if openMusic{
            play?.play()
        }else{
            play?.stop()
        }
        backgroundMusic(open: openMusic)
        if  openMusic{
            (sender as! UIButton).setImage(UIImage.init(named: "music_1"), for: .normal)
        }else{
            (sender as! UIButton).setImage(UIImage.init(named: "music"), for: .normal)
        }
    }
    
    func backgroundMusic(open:Bool){
        
    }
    
    @IBAction func aboutAction(_ sender: Any) {
        
        let about:AboutViewController = AboutViewController()
        if #available(iOS 13.0, *) {
            about.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        } else {
            // Fallback on earlier versions
        }
        self.present(about, animated: true, completion: nil);
    }
}
