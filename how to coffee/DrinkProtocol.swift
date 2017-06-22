//
//  drink.swift
//  how to coffee
//
//  Created by cody's macbook on 3/25/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation
enum Sizes : Int{
    case Short = 0
    case Tall = 1
    case Grande = 2
    case Venti = 3
    case Trenta = 4
}
let sizeStrings = ["Short","Tall","Grande","Venti"]
let ozStrings = ["8oz","12oz","16oz","20oz"]
enum Decaf : String {
    case x = "decaf"
    case half = "1/2"
}

enum Espresso : String {
    case long = "L"
    case ristretto = "R"
    case frapp = "FR"
    case regular = "r"
    case blonde = "B"
}

enum Sweeteners : String {
    case caramel = "C"
    case chai = "CH"
    case classic = "CL"
    case cinnamon = "CD"
    case caramelSauce = "CR"
    case hazelnut = "H"
    case mocha = "M"
    case peppermint = "P"
    case raspberry = "R"
    case vanilla = "V"
    case SFvanilla = "SFV"
    case toffeNut = "TN"
    case whiteMocha = "WH"

}

enum Milk : String {
    case whole = "WH"
    case nonfat = "N"
    case heavyCream = "HC"
    case soy = "S"
    case halfAndHalf = "B"
    case two = "2%"
}

enum Custom : String {
    case appleJuice = "AJ"
    case blackTea = "BT"
    case frappChip = "CHIP"
    case caramelSauce = "CR"
    case dry = "D"
    case wet = "W"
    case foamy = "F"
    case greenTea = "GT"
    case honey = "HN"
    case kid = "K"
    case lemonade = "LM"
    case mocha = "M"
    case matchaTea = "MT"
    case passionTea = "PT"
    case sweetNLow = "SL"
    case splenda = "SP"
    case sugarInRaw = "SR"
    case vanillaBeanPowder = "VB"
    case whippedCream = "WC"
    case HotWater = "HOTH20"
    case ColdWater = "COLDH20"
}
enum Mods : String {
    case extra = "X"
    case light = "L"
    case no = "/"
    case normal = "*"
}

enum Steam : Int {
    case fourSeconds  = 4
    case sevenSeconds = 7
    case zeroSeconds  = 0
}


protocol Drink {
    var iced:Bool   { get set }
    var size: Sizes? { get set }
    var sweetener: [Sweeteners: UInt ]? { get set }
    var custom: [ Custom : Mods ]? { get set }
    var shots:(espressoType:Espresso , numOfshots:Int )? { get set }
    var milk: (milkType:Milk,steamedFor:Steam)?  { get set }
    var name: String { get set }
    func setSize(size:Sizes)
    var drinkChars:String { get set }
}
