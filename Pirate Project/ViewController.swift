//
//  StartViewController.swift
//  Pirate Project
//
//  Created by Bruce Milyko on 7/21/14.
//  Copyright (c) 2014 Wizzard Works. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var startBackground: UIImageView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startBackground.image = UIImage(named: pickPicture())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

