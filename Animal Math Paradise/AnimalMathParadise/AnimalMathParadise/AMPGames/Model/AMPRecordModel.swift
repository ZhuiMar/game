//   
    

import Foundation

class AMPRecordGameModel {
    var animals:[String]?
    var animalNumber:[Int]?
    var result: Int?
    
    
    private let animalsImage = ["chook", "cow", "deer", "dog", "fish", "frog"]
    private let array = [Int](1...9)

    init() {
    }
    
    func changeAnimals(){
       
        animals = animalsImage[randomPick: 2]
        animalNumber = array[randomPick: 2]
        result = abs(animalNumber![0]-animalNumber![1])
    }
    
}

//struct AMPRecord {
//    let animals:[String]
//    let
//
//
//}
