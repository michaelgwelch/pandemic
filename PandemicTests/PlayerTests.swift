//
//  PlayerTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic

class PlayerTests: XCTestCase {

    func testDefaultPlayerHasNoCards() {
        let player = Player()
        XCTAssertTrue(player.cards == [])
    }

    func testDealPlayerACard_ThenItHasThatCard() {

        let player = Player()
        player.dealCard(PlayerCard.santiago)

        XCTAssertTrue(player.cards.contains(PlayerCard.santiago))

    }

}
