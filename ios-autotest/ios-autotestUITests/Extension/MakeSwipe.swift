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
        case up, down, left, right
    }
    
    func makeSwipe(direction: Direction, regulation: CGFloat) {
        let half            : CGFloat = 0.5
        let adjustment      : CGFloat = regulation
        let duration        : TimeInterval = 0.2
        
        let lessThanHalf    = half - adjustment
        let moreThanHalf    = half + adjustment
        
        let center          = coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCenter     = coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCenter     = coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCenter    = coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCenter   = coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))
        
        switch direction {
        case .left          : center.press(forDuration: duration, thenDragTo: leftOfCenter)
        case .right         : center.press(forDuration: duration, thenDragTo: rightOfCenter)
        case .up            : center.press(forDuration: duration, thenDragTo: aboveCenter)
        case .down          : center.press(forDuration: duration, thenDragTo: belowCenter)
        }
    }
}
