//
//  Character.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/26/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class Character: NSObject {
    var health = 0
    var cWeapon: Weapon
    var cArmor: Armor
    var cLocation = 0
    init(cWeapon: Weapon, cArmor: Armor){
//        self.health = health
        self.cWeapon = cWeapon
        self.cArmor = cArmor
//        self.cLocation = cLocation
    }
   
}

var myCharacter = Character(cWeapon: Weapon(name: "", damage: 0), cArmor: Armor(name: "", health: 0))


