//
//  Weapon.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/25/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit


class Weapon: NSObject {
    var name: String
    var damage: Int
    init(name: String, damage: Int){
        self.name = name
        self.damage = damage
    }
    
}

let gameWeapon = [
    Weapon(name: "Fists", damage: 5),
    Weapon(name: "Blunted Sword", damage: 13),
    Weapon(name: "Short Sword", damage: 24),
    Weapon(name: "Long Sword", damage: 33),
    Weapon(name: "Pistol", damage: 44)
]
