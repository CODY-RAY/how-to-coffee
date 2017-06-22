//
//  addOneForSize.swift
//  how to coffee
//
//  Created by cody's macbook on 4/12/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import Foundation


class help {
    internal func addForSize(_ numOfX : Int , size : Sizes ) -> Int {
        return numOfX + size.rawValue
    }
    internal func oneOrTwo(_ numOfX : Int , tipPoint : Sizes , size : Sizes ) -> Int {
        return numOfX + ((size.rawValue >= tipPoint.rawValue) ? 1 : 0)
    }
   
}

