//
//  PlayerCardTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic

class PlayerCardTests: XCTestCase {

    func testCanFindSanFrancisco() {
        let actualCity = PlayerCard.findCharByName("san ").first!

        XCTAssertEqual(PlayerCard.sanfrancisco, actualCity)
    }

    func testCanFindByAnyMatchingSubstring() {
        let actualCity = PlayerCard.findCharByName("anti").first!

        XCTAssertEqual(PlayerCard.santiago, actualCity)
    }

}
