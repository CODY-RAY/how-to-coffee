//
//  Latte.swift
//  how to coffee
//
//  Created by cody's macbook on 4/23/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation

final class Latte: help , Drink {
    var name: String = "Latte"
    var iced: Bool   = false
    var size: Sizes?
    var custom: [Custom : Mods]?
    var sweetener: [Sweeteners: UInt]?
    var shots:(espressoType:Espresso , numOfshots:Int )? = (Espresso.regular , 1)
    var milk: (milkType: Milk, steamedFor: Steam)? = (Milk.two, Steam.fourSeconds)
    var drinkChars:String = "l"
    
    func setSize(size:Sizes){
        
        self.size = size
        self.shots?.numOfshots = oneOrTwo(1, tipPoint: Sizes.Grande, size: size)
    }
}
