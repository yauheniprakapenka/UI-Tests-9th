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
        // This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        
        app.launchArguments.append("UITesting")
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run.
        XCUIDevice.shared.orientation = .portrait
        
        app.launch()
        
        checkDevice()
        checkAlertInterruption()
    }
    
    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
    }

    private func checkAlertInterruption() {
        addUIInterruptionMonitor(withDescription: "System Dialog") { (alert) -> Bool in
            let currentLocation = String(NSLocale.current.identifier)
            
            switch currentLocation {
            case "en_US": alert.buttons["Allow While Using App"].tap()
            case "ru_BY": alert.buttons["При использовании"].tap()
            default     : fatalError("Missing current location")
            }

            return true
        }
        app.tap()
    }
    
    private func checkDevice() {
        let deviceInfo = ["os"      : UIDevice.current.systemName,
                          "version" : UIDevice.current.systemVersion,
                          "model"   : UIDevice.current.name,
                          "uuid"    : UIDevice.current.identifierForVendor!.uuidString]
        
        guard deviceInfo["model"] == "iPhone 8" else {
            fatalError("Select simulator iPhone 8 to take the UI test")
        }
    }
}
