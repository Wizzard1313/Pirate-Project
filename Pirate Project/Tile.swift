//
//  Tile.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/25/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class Tile: NSObject {
    var tileText: String
    var tileWepon: Weapon
    var tileArmor: Armor
    var tileN: Int
    var tileS: Int
    var tileE: Int
    var tileW: Int
    var special: String
    var specialHealth: Int
    var specialEscape: Bool
    init(tileText: String, tileWepon: Weapon, tileArmor: Armor, tileN: Int, tileS: Int, tileE: Int, tileW: Int, special: String, specialHealth: Int, specialEscape: Bool){
        self.tileText = tileText
        self.tileWepon = tileWepon
        self.tileArmor = tileArmor
        self.tileN = tileN
        self.tileS = tileS
        self.tileE = tileE
        self.tileW = tileW
        self.special = special
        self.specialHealth = specialHealth
        self.specialEscape = specialEscape
    }


}

var tileGrid = [
    Tile(tileText: "", tileWepon: Weapon(name: "", damage: 0), tileArmor: Armor(name: "", health: 0), tileN: 0, tileS: 0, tileE: 0, tileW: 0, special: "", specialHealth: 0, specialEscape: true)
]

func resetGrid()  {
    tileGrid = [
        Tile(tileText: "Welcome to the pirate adventure! You need to find and kill the Boss pirate. As you look around you find ", tileWepon: Weapon(name: gameWeapon[1].name, damage: gameWeapon[1].damage), tileArmor: Armor(name: "", health: -1), tileN: 4, tileS: -1, tileE: 1, tileW: -1, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "More beach to wander around on. As you explore you see ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: gameArmor[1].name, health: gameArmor[1].health), tileN: 5, tileS: -1, tileE: 2, tileW: 0, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "Still more sandy beach around you. Searching here you find ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: "", health: -1), tileN: 6, tileS: -1, tileE: 3, tileW: 1, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "Yet more beach to explore. searching here you find ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: gameArmor[3].name, health: gameArmor[3].health), tileN: 7, tileS: -1, tileE: -1, tileW: 2, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "More beach for you to explore. As you look around you find ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: "", health: -1), tileN: 8, tileS: 0, tileE: 5, tileW: -1, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "You are captured by pirates. You will have to walk the plank.", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: "", health: -1), tileN: 9, tileS: 1, tileE: 6, tileW: 4, special: "Be brave", specialHealth: -15, specialEscape: false),
        Tile(tileText: "You have found some sparce grass along the beach. Searching in the grass you find ", tileWepon: Weapon(name: gameWeapon[3].name, damage: gameWeapon[3].damage), tileArmor: Armor(name: "", health: -1), tileN: 10, tileS: 2, tileE: 7, tileW: 5, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "You have found the Boss pirate. Will you fight or run away?", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: "", health: -1), tileN: 11, tileS: 3, tileE: -1, tileW: 6, special: "Fight Boss", specialHealth: 0, specialEscape: false),
        Tile(tileText: "You have wandered into some small bushes. Looking under the bushes you discover ", tileWepon: Weapon(name: gameWeapon[2].name, damage: gameWeapon[2].damage), tileArmor: Armor(name: "", health: -1), tileN: -1, tileS: 4, tileE: 9, tileW: -1, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "You have found a small group of trees. Searching around them you discover ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: gameArmor[2].name, health: gameArmor[2].health), tileN: -1, tileS: 5, tileE: 10, tileW: 8, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "You have found a sparce stand of trees. Searching around them you find ", tileWepon: Weapon(name: "", damage: -1), tileArmor: Armor(name: "", health: -1), tileN: -1, tileS: 6, tileE: 11, tileW: 9, special: "", specialHealth: 0, specialEscape: true),
        Tile(tileText: "You come accross a dead pirate. Next to the body you notice ", tileWepon: Weapon(name: gameWeapon[4].name, damage: gameWeapon[4].damage), tileArmor: Armor(name: "", health: -1), tileN: -1, tileS: 7, tileE: -1, tileW: 10, special: "", specialHealth: 0, specialEscape: true)
    ]
}

 