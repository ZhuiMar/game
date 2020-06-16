//
//  AMPThemeColorBg.swift
//  AnimalMathParadise
//
//  Created by liping on 2020/6/10.
//  Copyright © 2020 www. All rights reserved.
//

import UIKit

class AMPThemeColorBg: NSObject {
    typealias ThemeDefaultColorBlock = () -> Void
    var defaultColor: ThemeDefaultColorBlock?
    func getDefaultView() {
        self.defaultColor!()
    }
}
