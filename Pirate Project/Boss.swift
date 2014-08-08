//
//  Boss.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/31/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class Boss: NSObject {
    var bossHealth: Int
    var bossDamage: Int
    init(bossHealth: Int, bossDamage: Int) {
        self.bossHealth = bossHealth
        self.bossDamage = bossDamage
    }
}
 var theBoss = Boss(bossHealth: 0, bossDamage: 0)