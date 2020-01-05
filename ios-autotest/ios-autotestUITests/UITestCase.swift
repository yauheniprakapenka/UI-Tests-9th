//
//  UITests.swift
//  ios-autotestUITests
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import XCTest

class UITestCase: SetupUITest {
    
    func testTapOnCoordinate() {
        tapOnCoordinate(at: 41, and: 122)
        XCTAssertTrue(app.staticTexts["Кнопка 1 нажата"].exists)
        tapOnCoordinate(at: 144, and: 122)
        XCTAssertTrue(app.staticTexts["Кнопка 2 нажата"].exists)
        tapOnCoordinate(at: 248, and: 122)
        XCTAssertTrue(app.staticTexts["Кнопка 3 нажата"].exists)
    }
    
    func testGetNumberOfElementsMatchingIdentifier() {
        let buttonWithTestOneID = app.buttons.matching(identifier: "testOneID").count
        XCTAssertTrue(buttonWithTestOneID == 2)
        let buttonWithTestTwoID = app.buttons.matching(identifier: "testTwoID").count
        XCTAssertTrue(buttonWithTestTwoID == 1)
    }
    
    func testCheckLabelWithArgument() {
        XCTAssertTrue(app.staticTexts["👩‍🔬💉 Режим ui тестирования"].exists)
    }

    func testNotFitText() {
        XCTAssertTrue(app.staticTexts["Winnie-the-Pooh lived in a forest all by himself under the name of Sanders."].exists)
    }
    
    func testWaitingForAnElementToAppear() {
        app.buttons["Показать скрытый текст"].tap()
        XCTAssertTrue(app.staticTexts["А вот и я"].waitForExistence(timeout: 7))
    }
    
    func testFork() {
        let text = app.staticTexts["Этот текст не появится"]
        
        app.buttons["Показать скрытый текст"].tap()
        _ = text.waitForExistence(timeout: 5) // ждем появления text
        
        if text.exists { // не выполнится
            app.buttons["Кнопка 1"].tap()
            XCTAssertTrue(app.staticTexts["Кнопка 1 нажата"].exists)
        } else { // выполнится
            app.buttons["Кнопка 3"].tap()
            XCTAssertTrue(app.staticTexts["Кнопка 3 нажата"].exists)
        }
    }
    
    func testCheatSheet() {
        
        // Тапнуть на кнопку
        app.buttons["Кнопка 3"].tap()
        XCTAssertTrue(app.staticTexts["Кнопка 3 нажата"].exists)
        
        // Ввести текст в текстовое поле
        app.textFields["Введите текст"].tap()
        app.textFields["Введите текст"].typeText("аАяЯaAzZ09!)=|")
        app.buttons["Отправить"].tap()
        XCTAssertTrue(app.staticTexts["аАяЯaAzZ09!)=| отправлен"].exists)
    }
    
    func testStateChange() {
        XCUIDevice.shared.press(.home)
        XCTAssertTrue(app.wait(for: .runningBackground, timeout: 5))
        
        app.activate()
        XCTAssertTrue(app.state == .runningForeground)
        
        app.terminate()
        XCTAssertTrue(app.state == .notRunning)
        
        app.launch()
        XCTAssertTrue(app.state == .runningForeground)
    }
    
}
