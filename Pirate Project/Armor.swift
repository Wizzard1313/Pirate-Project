//
//  Armor.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/26/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class Armor: NSObject {
    var name: String
    var health: Int
    init(name: String, health: Int) {
        self.name = name
        self.health = health
    }
    
}

let gameArmor = [
    Armor(name: "Cloak", health: 5),
    Armor(name: "Leather Armor", health: 15),
    Armor(name: "Chain Mail", health: 33),
    Armor(name: "Plate Mail", health: 44)
]
    