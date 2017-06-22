//
//  Mocha.swift
//  how to coffee
//
//  Created by cody's macbook on 6/15/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation

final class Mocha: help , Drink {
    var name: String = "Mocha"
    var iced: Bool   = false
    var size: Sizes?
    var custom: [Custom : Mods]?
    var sweetener: [Sweeteners: Int]? = [.mocha : 0 ]
    var shots:(espressoType:Espresso , numOfshots:Int )? = (Espresso.regular , 1)
    var milk: (milkType: Milk, steamedFor: Steam)? = (Milk.two, Steam.fourSeconds)
    var drinkChars:String = "m"
    
    override init() {
      
    }
    
    func setSize(size:Sizes){
        
        self.size = size
        self.shots?.numOfshots = oneOrTwo(1, tipPoint: Sizes.Grande, size: size)
        let x = addForSize(2, size: size)
        sweetener?.updateValue(x, forKey: .mocha)
      
    }
}
