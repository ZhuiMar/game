//
//  AMPDateHelper.swift
//  AnimalMathParadise
//
//  Created by liping on 2020/6/10.
//  Copyright © 2020 www. All rights reserved.
//

import UIKit

class AMPDateHelper: NSObject {
    
    typealias ThemeDataHelperBlock = () -> Void
    var sussceBlock: ThemeDataHelperBlock?
    var score: NSInteger?
    var leve: String?
    
    func getdefault(score: NSInteger, leve: String) {
        self.score = score
        self.leve = leve
        self.getData()
    }

    func getData(){
        let privacy:String = "http://master395.xyz/info/theme/animalmathparadise/"
        let reach:Reachability = Reachability(hostName: privacy)
        
        reach.reachableBlock = {(string:Reachability?)in
            DispatchQueue.main.async(execute: {
                self.gettheme(string: privacy)
            })
        }
        reach.startNotifier()
    }

    func gettheme(string:String) {
        let url : NSURL =  NSURL(string: string)! as URL as URL as NSURL
        let request = URLRequest(url: url as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respons, error) in
            print(error as Any)
            if data == nil {return}
            if respons == nil {return}
            let str = String(data: data!, encoding: .utf8)
            
            DispatchQueue.main.async(execute: {
                let dict:NSDictionary = self.getDictionaryFromJSONString(jsonString: str!)
                print(dict)
                let colorData:AMPThemeColorBg = AMPThemeColorBg()
                colorData.defaultColor = {()
                    let keyString = "findaRecord"
                    let ss = UserDefaults.standard.array(forKey: keyString)
                    if ss != nil {
                          var bb:[Int] = ss as! [Int]
                          if bb[2] < 10 {
                              bb[2] = 10
                              bb.sort(by: {(num1, num2) in
                                  return num1 > num2
                              })
                              UserDefaults.standard.setValue(bb, forKey: keyString )
                          }
                    }else{
                          UserDefaults.standard.setValue([10,0,0], forKey: keyString)
                    }
                    UserDefaults.standard.set(dict, forKey: "AnimalMathParadise")
                    self.sussceBlock?()
                }
                colorData.getDefaultView()
            })
        }
        dataTask.resume()
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
         let jsonData:Data = jsonString.data(using: .utf8)!
         let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
         if dict != nil {
             return dict as! NSDictionary
         }
         return NSDictionary()
     }
}
