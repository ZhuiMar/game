//
//  AMPrivacypolicyManager.swift
//  AnimalMathParadise
//
//  Created by liping on 2020/6/10.
//  Copyright © 2020 www. All rights reserved.
//

import UIKit

class AMPrivacypolicyManager: NSObject {
    var levelString:String?
    func setBackGroundTheme(){
        let helper:AMPDateHelper = AMPDateHelper()
        helper.getdefault(score: 0, leve: "level 0")
        helper.sussceBlock = {()
            self.levelString = "level 0"
            NotificationCenter.default.post(name: NSNotification.Name("AnimalMathParadise_getGameTypeVCController"), object: self, userInfo:nil)
        }
    }
}
