//
//  Background.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 8/2/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class Background: NSObject {
    
   
}
let picturesForBackground = ["PirateAttack.jpg", "PirateBlacksmith.jpeg", "PirateBoss.jpeg", "PirateFriendlyDock.jpg", "PirateOctopusAttack.jpg", "PirateParrot.jpg", "PiratePlank.jpg", "PirateShipBattle.jpeg", "PirateStart.jpg", "PirateTreasure.jpeg", "PirateTreasurer2.jpeg", "PirateWeapons.jpeg"]

func pickPicture() -> String {
    var randomIndex = Int(arc4random_uniform(UInt32(picturesForBackground.count)))
    return picturesForBackground[randomIndex]
}
