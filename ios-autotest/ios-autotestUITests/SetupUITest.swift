//
//  SetupUITest.swift
//  ios-autotestUITests
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import XCTest

class SetupUITest: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments.append("UITesting")
        app.launch()
        
        addUIInterruptionMonitor()
    }

    private func addUIInterruptionMonitor() {
        addUIInterruptionMonitor(withDescription: "System Dialog") { (alert) -> Bool in
            let currentLocation = String(NSLocale.current.identifier)
            print(currentLocation)
            
            if currentLocation == "en_US" {
                alert.buttons["Allow While Using App"].tap()
            } else if currentLocation == "ru_BY" {
                alert.buttons["При использовании"].tap()
            }

            return true
        }
    }
}
