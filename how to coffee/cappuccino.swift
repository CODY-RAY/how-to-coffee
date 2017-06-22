//
//  cappuccino.swift
//  how to coffee
//
//  Created by cody's macbook on 5/22/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation
final class Cappuccino: help , Drink {
    var name: String = "Cappuccino"
    var iced: Bool   = false
    var size: Sizes?
    var custom: [Custom : Mods]?
    var sweetener: [Sweeteners: UInt]?
    var shots:(espressoType:Espresso , numOfshots:Int )? = (Espresso.regular , 1)
    var milk: (milkType: Milk, steamedFor: Steam)? = (Milk.two, Steam.sevenSeconds)
    var drinkChars:String = "c"
    
    func setSize(size:Sizes){
        
        self.size = size
        self.shots?.numOfshots = oneOrTwo(1, tipPoint: Sizes.Grande, size: size)
    }
}
