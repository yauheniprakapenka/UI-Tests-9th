//
//  UITests.swift
//  ios-autotestUITests
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import XCTest

class UITests: UITestCase {
    
    func testTapOnCoordinate() {
        tapOnCoordinate(at: 41, and: 162)
        XCTAssert(app.staticTexts["Кнопка 1 нажата"].exists)
        tapOnCoordinate(at: 156, and: 168)
        XCTAssert(app.staticTexts["Кнопка 2 нажата"].exists)
        tapOnCoordinate(at: 260, and: 168)
        XCTAssert(app.staticTexts["Кнопка 3 нажата"].exists)
    }
    
    func testGetNumberOfElementsMatchingIdentifier() {
        let buttonWithTestOneID = app.buttons.matching(identifier: "testOneID").count
        XCTAssertTrue(buttonWithTestOneID == 2)
        let buttonWithTestTwoID = app.buttons.matching(identifier: "testTwoID").count
        XCTAssertTrue(buttonWithTestTwoID == 1)
    }
    
    func testCheckLabelWithArgument() {
        XCTAssert(app.staticTexts["Идет UI тестирование! 🦠"].exists)
    }
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }

}
