//
//  MakeSwipe.swift
//  ios-autotestUITests
//
//  Created by yauheni prakapenka on 06.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import XCTest

extension XCUIElement {
    enum Direction {
        case Up, Down, Left, Right
    }

    func makeSwipe(direction: Direction, adjustment: CGFloat) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = adjustment
        let pressDuration: TimeInterval = 0.05

        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment

        let centre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))

        switch direction {
        case .Up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
        case .Down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
        case .Left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
        case .Right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
        }
    }
}
