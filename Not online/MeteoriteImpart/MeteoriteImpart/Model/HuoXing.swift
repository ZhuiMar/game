//
//  HuoXing.swift
//  MeteoriteImpart
//
//  Created by Mac on 2020/4/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Foundation

class HuoXing {
    var huoQius = [HuoQiu]()
    
    var selectedIndex : Int = 0
    
    func isCorrectResult(_ value:Int)->(Bool){
        if (huoQius[selectedIndex].shuZu[2] == value){
            self.hideSlectedHuoXing()
            return true
        }else{
            return false
        }
    }
    
    func hideSlectedHuoXing(){
        huoQius[selectedIndex].isHide = true
        huoQius[selectedIndex].isSelct = false
        selectedIndex = (selectedIndex+1)%self.huoQius.count
        huoQius[selectedIndex].isSelct = true
    }
    
    func moveHuoXingToTop(index:Int){
        huoQius[index].isHide = false
    }
    
    init(number:Int) {
        for _ in 0..<number{
            self.huoQius.append(HuoQiu())
        }
        if number > 0{
            self.huoQius[0].isSelct = true
        }
    }
 
}



struct HuoQiu {
    var isSelct = false
    var shuZu : [Int]
    var isHide = false{
        willSet{
            if newValue {
                self.shuZu = HuoQiu.getShuZu()
            }
        }
    }
    
    static func getShuZu() ->[Int]{
        
        return[Int(arc4random()%9+1),Int(arc4random()%9+1),Int(arc4random()%9+1)]
    }
    
    init() {
        self.shuZu = HuoQiu.getShuZu()
    }
    
}
