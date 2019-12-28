//
//  ViewController.swift
//  ios-autotest
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var withoutArgumentLabel: UILabel!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttobThree: UIButton!
    
    var countTimer = 0
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        startTimer()
        
        if ProcessInfo.processInfo.arguments.contains("UITesting") {
            withoutArgumentLabel.text = "Идет UI тестирование! 🦠"
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        resultLabel.text = "\(sender.currentTitle ?? "") нажата"
        
        let buttons = [buttonOne, buttonTwo, buttobThree]
        
        for button in buttons {
            button?.backgroundColor = #colorLiteral(red: 0.0759813115, green: 0.6622361541, blue: 0.9625448585, alpha: 1)
        }
        
        sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showLabel), userInfo: nil, repeats: false)
    }
    
    @objc func showLabel() {
        hiddenLabel.alpha = 1
    }
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countSeconds), userInfo: nil, repeats: true)
    }
    
    @objc func countSeconds() {
        timerLabel.text = String(countTimer)
        countTimer += 1
    }
}
