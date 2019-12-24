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
        tapOnCoordinate(at: 41, and: 102)
        XCTAssertTrue(app.staticTexts["Кнопка 1 нажата"].exists)
        tapOnCoordinate(at: 144, and: 102)
        XCTAssertTrue(app.staticTexts["Кнопка 2 нажата"].exists)
        tapOnCoordinate(at: 248, and: 102)
        XCTAssertTrue(app.staticTexts["Кнопка 3 нажата"].exists)
    }
    
    func testGetNumberOfElementsMatchingIdentifier() {
        let buttonWithTestOneID = app.buttons.matching(identifier: "testOneID").count
        XCTAssertTrue(buttonWithTestOneID == 2)
        let buttonWithTestTwoID = app.buttons.matching(identifier: "testTwoID").count
        XCTAssertTrue(buttonWithTestTwoID == 1)
    }
    
    func testCheckLabelWithArgument() {
        XCTAssertTrue(app.staticTexts["Идет UI тестирование! 🦠"].exists)
    }

    func testNotFitText() {
        XCTAssertTrue(app.staticTexts["Winnie-the-Pooh lived in a forest all by himself under the name of Sanders."].exists)
    }
    
    func testWaitingForAnElementToAppear() {
        app.buttons["Показать лейбл"].tap()
        
        let label = app.staticTexts["А вот и я"]
        XCTAssertFalse(label.exists)
        
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        
        waitForExpectations(timeout: 4, handler: nil)
        XCTAssertTrue(label.exists)
    }
}
