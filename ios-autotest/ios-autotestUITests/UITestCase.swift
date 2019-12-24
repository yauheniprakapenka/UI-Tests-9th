//
//  ios_autotestUITests.swift
//  ios-autotestUITests
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import XCTest

class UITestCase: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments.append("UITesting")
        app.launch()
    }

    override func tearDown() {
        
    }
}
