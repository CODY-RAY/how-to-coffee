//
//  generator.swift
//  how to coffee
//
//  Created by cody's macbook on 5/22/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation
struct Generator {
    static let arrayOfDrinks:[Drink] = [ HotChocolate(),Latte(),Americano(),Cappuccino(),Mocha()]
    
    func getDrink() -> Drink {
        
        let drink = Generator.arrayOfDrinks[Int(arc4random_uniform(UInt32(Generator.arrayOfDrinks.count)))]
        drink.setSize(size: Sizes(rawValue: Int(arc4random_uniform(4)))!)
        return drink
    }
}
