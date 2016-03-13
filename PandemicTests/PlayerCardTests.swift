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
        let actualCity = PlayerCard.findByName("san ").first!

        XCTAssertEqual(PlayerCard.sanfrancisco, actualCity)
    }

    func testCanFindByAnyMatchingSubstring() {
        let actualCity = PlayerCard.findByName("anti").first!

        XCTAssertEqual(PlayerCard.santiago, actualCity)
    }

    func testCanFindSáoPaulo() {
        let actualCity = PlayerCard.findByName("sao").first!

        XCTAssertEqual(PlayerCard.saopaulo, actualCity)


        let actualCity2 = PlayerCard.findByName("são").first!
        XCTAssertEqual(PlayerCard.saopaulo, actualCity2)
    }

    func testCanFindBogotá() {
        var actualCity = PlayerCard.findByName("bogota").first!
        XCTAssertEqual(PlayerCard.bogota, actualCity)

        actualCity = PlayerCard.findByName("gotá").first!
        XCTAssertEqual(PlayerCard.bogota, actualCity)
    }

}
