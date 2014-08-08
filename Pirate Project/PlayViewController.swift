//
//  PlayViewController.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/25/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet weak var playBackground: UIImageView!
    @IBOutlet weak var healthValue: UILabel!
    @IBOutlet weak var damageValue: UILabel!
    @IBOutlet weak var weaponUsed: UILabel!
    @IBOutlet weak var armorUsed: UILabel!
    @IBOutlet weak var storyLable: UILabel!
    @IBOutlet weak var northButton: UIButton!
    @IBOutlet weak var southButton: UIButton!
    @IBOutlet weak var eastButton: UIButton!
    @IBOutlet weak var westButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackground()
        configureButtons()
        resetGrid()
        myCharacter.cWeapon.name = gameWeapon[0].name
        myCharacter.cWeapon.damage = gameWeapon[0].damage
        myCharacter.cArmor.name = gameArmor[0].name
        myCharacter.cArmor.health = gameArmor[0].health
        myCharacter.health = 100 + myCharacter.cArmor.health
        myCharacter.cLocation = 0
        theBoss.bossHealth = 200
        theBoss.bossDamage = 35
        updateLables(health: myCharacter.health, damage: myCharacter.cWeapon.damage, weapon: myCharacter.cWeapon.name, armor: myCharacter.cArmor.name)
        updateScreen(myCharacter.cLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func changeBackground()  {
        self.playBackground.image = UIImage(named: pickPicture())
    }
    
    func updateLables(#health:Int, damage:Int, weapon:String, armor:String){
        self.healthValue.text = "\(health)"
        self.damageValue.text = "\(damage)"
        self.weaponUsed.text = weapon
        self.armorUsed.text = armor
    }
    
    func configureButtons() {
        northButton.addTarget(self, action: "northClicked:", forControlEvents: .TouchUpInside)
        southButton.addTarget(self, action: "southClicked:", forControlEvents: .TouchUpInside)
        eastButton.addTarget(self, action: "eastClicked:", forControlEvents: .TouchUpInside)
        westButton.addTarget(self, action: "westClicked:", forControlEvents: .TouchUpInside)
        actionButton.addTarget(self, action: "actionClicked:", forControlEvents: .TouchUpInside)
    }
    
    func northClicked(sender: UIButton){
        myCharacter.cLocation = tileGrid[myCharacter.cLocation].tileN
        updateScreen(myCharacter.cLocation)
    }
    func southClicked(sender: UIButton){
        myCharacter.cLocation = tileGrid[myCharacter.cLocation].tileS
        updateScreen(myCharacter.cLocation)
    }
    func eastClicked(sender: UIButton){
        myCharacter.cLocation = tileGrid[myCharacter.cLocation].tileE
        updateScreen(myCharacter.cLocation)
    }
    func westClicked(sender: UIButton){
        myCharacter.cLocation = tileGrid[myCharacter.cLocation].tileW
        updateScreen(myCharacter.cLocation)
    }
    func actionClicked(sender: UIButton){
        if !tileGrid[myCharacter.cLocation].tileWepon.name.isEmpty {
            myCharacter.cWeapon.name = tileGrid[myCharacter.cLocation].tileWepon.name
            myCharacter.cWeapon.damage = tileGrid[myCharacter.cLocation].tileWepon.damage
            tileGrid[myCharacter.cLocation].tileWepon.name = ""
            tileGrid[myCharacter.cLocation].tileWepon.damage = -1
        } else if !tileGrid[myCharacter.cLocation].tileArmor.name.isEmpty {
            myCharacter.health = myCharacter.health - myCharacter.cArmor.health + tileGrid[myCharacter.cLocation].tileArmor.health
            myCharacter.cArmor.name = tileGrid[myCharacter.cLocation].tileArmor.name
            myCharacter.cArmor.health = tileGrid[myCharacter.cLocation].tileArmor.health
            tileGrid[myCharacter.cLocation].tileArmor.name = ""
            tileGrid[myCharacter.cLocation].tileArmor.health = -1
        } else if tileGrid[myCharacter.cLocation].special == "Fight Boss" {
            myCharacter.health -= (theBoss.bossDamage + Int(arc4random_uniform(UInt32(10))))
            theBoss.bossHealth -= (myCharacter.cWeapon.damage + Int(arc4random_uniform(UInt32(13))))
            if theBoss.bossHealth <= 0 {
                gameEndAlert("You Won", message: "You beat the Boss Pirate. Do you want to try again?")
                return
            }
            if myCharacter.health <= 0 {
                gameEndAlert("You Lost", message: "The Boss killed you. Do you want to try again?")
                return
            }
        }else  {
            myCharacter.health += (tileGrid[myCharacter.cLocation].specialHealth + Int(arc4random_uniform(UInt32(5))))
            if myCharacter.health <= 0 {
            gameEndAlert("You Lost", message: "You were killed. Do you want to try again?")
            }
        }
        
        updateLables(health: myCharacter.health, damage: myCharacter.cWeapon.damage, weapon: myCharacter.cWeapon.name, armor: myCharacter.cArmor.name)
        updateScreen(myCharacter.cLocation)
    }
    
    func updateScreen(currentLoc:Int){
        var storyText = tileGrid[currentLoc].tileText
        if tileGrid[currentLoc].tileN == -1{
            self.northButton.hidden = true
        } else {
            self.northButton.hidden = false
        }
        if tileGrid[currentLoc].tileS == -1{
            self.southButton.hidden = true
        } else {
            self.southButton.hidden = false
        }
        if tileGrid[currentLoc].tileE == -1{
            self.eastButton.hidden = true
        } else {
            self.eastButton.hidden = false
        }
        if tileGrid[currentLoc].tileW == -1{
            self.westButton.hidden = true
        } else {
            self.westButton.hidden = false
        }
        if tileGrid[currentLoc].tileWepon.name.isEmpty && tileGrid[currentLoc].tileArmor.name.isEmpty && tileGrid[currentLoc].special.isEmpty {
            self.actionButton.hidden = true
            storyText += "nothing."
        } else {
            self.actionButton.hidden = false
            if !tileGrid[currentLoc].tileWepon.name.isEmpty {
                storyText += "a \(tileGrid[currentLoc].tileWepon.name)"
                let buttonTitle = NSLocalizedString("Get \(tileGrid[currentLoc].tileWepon.name)", comment: "")
                actionButton.setTitle(buttonTitle, forState: .Normal)
            }else if !tileGrid[currentLoc].tileArmor.name.isEmpty {
                storyText += "some \(tileGrid[currentLoc].tileArmor.name)"
                let buttonTitle = NSLocalizedString("Get \(tileGrid[currentLoc].tileArmor.name)", comment: "")
                actionButton.setTitle(buttonTitle, forState: .Normal)
            }else {
                let buttonTitle = NSLocalizedString(tileGrid[currentLoc].special, comment: "")
                actionButton.setTitle(buttonTitle, forState: .Normal)
                if !tileGrid[currentLoc].specialEscape {
                    hideAllDirections()
                    tileGrid[currentLoc].specialEscape = true
                }
            }
        }
        self.storyLable.text = storyText
        changeBackground()
    }
    
    func hideAllDirections() {
        self.northButton.hidden = true
        self.southButton.hidden = true
        self.eastButton.hidden = true
        self.westButton.hidden = true
    }
    
    func gameEndAlert(title: String, message: String) {
        let alertTitle = NSLocalizedString(title, comment: "")
        let alertMessage = NSLocalizedString(message, comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            self.hideButtons()
        }
        
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func hideButtons() {
        hideAllDirections()
        self.actionButton.hidden = true
        self.storyLable.text = "Tap on the \"Reset Game\" button to play again"
    }

}
