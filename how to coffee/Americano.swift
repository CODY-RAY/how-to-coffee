//
//  Americano.swift
//  how to coffee
//
//  Created by cody's macbook on 4/16/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation

final class Americano: help, Drink {
    var name: String = "Americano"
    var iced:Bool = false
    var size: Sizes?
    var custom: [Custom : Mods]?
    var sweetener: [Sweeteners: UInt]?
    var shots:(espressoType:Espresso , numOfshots:Int )? = (Espresso.regular , 1)
    var milk: (milkType: Milk, steamedFor: Steam)? = nil
    var drinkChars:String = "a"
    
    override init() {
        custom = [Custom : Mods]()
    }
    
    func setSize(size:Sizes){
        self.size = size
        custom?[.HotWater] = Mods.normal
        shots?.numOfshots = addForSize(1, size: size)
    }
}
