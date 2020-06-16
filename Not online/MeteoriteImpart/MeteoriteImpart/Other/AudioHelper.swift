//
//  AudioHelper.swift
//  MeteoriteImpart
//
//  Created by Mac on 2020/4/24.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit
import AVFoundation


class AudioHelper: NSObject {
    
    static let sharedAudio = AudioHelper()
    private override init() {}
    
    var openMusic :Bool = true
    
    
    func playAudio(_ audioName : String, _ isAlert : Bool = false,  _ completion : (() -> ())? = nil) {

        if !openMusic {
            return
        }
        var soundID : SystemSoundID = 0
        
        guard let fileURL = Bundle.main.url(forResource: audioName, withExtension: nil) else { return }
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        if isAlert {
            AudioServicesPlayAlertSoundWithCompletion(soundID, completion)
        } else {
            AudioServicesPlaySystemSoundWithCompletion(soundID, completion)
        }
        
    }
    
    
    
   
    func playMusic(audioUrl: URL, playFinish: ()->()) ->(AVAudioPlayer?) {
        
        do {
            let play = try AVAudioPlayer.init(contentsOf: audioUrl)
            play.prepareToPlay()
            play.numberOfLoops = -1
            return play
        } catch  {
            print("'")
        }
        
        return nil
    }
}
