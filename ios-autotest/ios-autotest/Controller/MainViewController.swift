//
//  ViewController.swift
//  ios-autotest
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttobThree: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        resultLabel.text = "\(sender.currentTitle ?? "") нажата"
        
        let buttons = [buttonOne, buttonTwo, buttobThree]
        
        for button in buttons {
            button?.backgroundColor = #colorLiteral(red: 0.0759813115, green: 0.6622361541, blue: 0.9625448585, alpha: 1)
        }
        
        sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }

}

