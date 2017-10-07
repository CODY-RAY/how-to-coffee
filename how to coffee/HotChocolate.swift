//
//  HotChocolate.swift
//  how to coffee
//
//  Created by cody's macbook on 6/29/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation


final class HotChocolate: help , Drink {
    var name: String = "Hot Chocolate"
    var iced: Bool   = false
    var size: Sizes?
    var custom: [Custom : Mods]?
    var sweetener: [Sweeteners: Int]? = [.mocha : 0 ]
    var shots:(espressoType:Espresso , numOfshots:Int )?
    var milk: (milkType: Milk, steamedFor: Steam)? = (Milk.two, Steam.fourSeconds)
    var drinkChars:String = "hc"
    
    override init() {
        
    }
    
    func setSize(size:Sizes){
        
        self.size = size
        let m = addForSize(2, size: size)
        let v = oneOrTwo(1, tipPoint: .Venti, size: size)
        sweetener?.updateValue(m, forKey: .mocha)
        sweetener?.updateValue(v, forKey: .vanilla)
    }
}
