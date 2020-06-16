//   
    

import Foundation

class CDDesserModel {
    var dessers = [Desser]()
    init(imageNames:[String],desserNumber:Int) {
        for i in 0..<desserNumber{
            dessers.append(Desser.init(imageNames: imageNames, indentfier: i))
        }
    }
}

struct Desser{
    var isHide:Bool = false
    var isInAnimation = false
    var indentfier:Int?
    var imageName:String?
    private var imageNames:[String]
    init(imageNames:[String]  ,indentfier:Int) {
        self.imageNames = imageNames
        self.indentfier = indentfier
        self.imageName = self.imageNames[self.imageNames.count.arc4random]
    }
    mutating func startAnimation(){
        self.imageName = self.imageNames[self.imageNames.count.arc4random]
        self.isInAnimation = true
    }
}

