//   
   

import Foundation

class GHGameModel {
    
    var houseImages :[String]!
    var houseNumber = [Int:Bool]()
    var houseSum :Int!
    var housePosition :String!
    private var allHouseImages:[String]
    private var gamelevel : Gamelevel
    
    init(allHouseImage:[String], gameLevel:Gamelevel) {
        self.allHouseImages = allHouseImage
        self.gamelevel = gameLevel
    }
    
    
    func changeData() {
        self.houseImages = allHouseImages[randomPick:3]
        housePosition = ["left","middle", "right"][3.arc4random]
        switch gamelevel {
        case .simple:
            houseSum = (19.arc4random + 2)*3
            
        case .general:
            houseSum = (30.arc4random + 21)*3
        case .hard:
            houseSum = (50.arc4random + 51)*3
        
        }
        
        houseNumber.removeAll()
        var rightNumber = 0
        if  housePosition == "left"{
            rightNumber = houseSum/3 - 1
        }else if housePosition == "middle"{
            rightNumber = houseSum/3
        }else{
            rightNumber = houseSum/3 + 1
        }
        
        houseNumber[rightNumber] = true
        
        while houseNumber.count < 3 {
            let aa = 7.arc4random - 3 + rightNumber
            if !houseNumber.keys.contains(aa) && aa > 0{
                houseNumber[aa] = false
            }
        }
        
    }
    
}


