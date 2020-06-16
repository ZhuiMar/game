//   
   

import Foundation

class AMPFindGameModel {
    
    var animals:[String]?
    var result: Int?
    var slectedAnimal:String?
    
    
    private let animalsImage = ["chook", "cow", "deer", "dog", "fish", "frog"]
    private let array = [Int](1...9)
    
    init() {
//        changeAnimals()
    }
    
    func changeAnimals(){
        let numbers = 5.arc4random + 4
        let anim = animalsImage[randomPick: 2]
        slectedAnimal = anim[1]
        animals = Array(repeating: anim[0], count: numbers)
        let num = numbers.arc4random
        animals![num] = anim[1]
        result = num + 1
    }
    
}


