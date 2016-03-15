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

        XCTAssertEqual(PlayerCard.sãopaulo, actualCity)


        let actualCity2 = PlayerCard.findByName("são").first!
        XCTAssertEqual(PlayerCard.sãopaulo, actualCity2)
    }

    func testCanFindBogotá() {
        var actualCity = PlayerCard.findByName("bogota").first!
        XCTAssertEqual(PlayerCard.bogotá, actualCity)

        actualCity = PlayerCard.findByName("gotá").first!
        XCTAssertEqual(PlayerCard.bogotá, actualCity)
    }

}

class InfectionCardTests: XCTestCase {

    func testCanFindSanFrancisco() {
        let actualCity = InfectionCard.findByName("san ").first!

        XCTAssertEqual(InfectionCard.sanfrancisco, actualCity)
    }

    func testCanFindByAnyMatchingSubstring() {
        let actualCity = InfectionCard.findByName("anti").first!

        XCTAssertEqual(InfectionCard.santiago, actualCity)
    }

    func testCanFindSáoPaulo() {
        let actualCity = InfectionCard.findByName("sao").first!

        XCTAssertEqual(InfectionCard.sãopaulo, actualCity)


        let actualCity2 = InfectionCard.findByName("são").first!
        XCTAssertEqual(InfectionCard.sãopaulo, actualCity2)
    }

    func testCanFindBogotá() {
        var actualCity = InfectionCard.findByName("bogota").first!
        XCTAssertEqual(InfectionCard.bogotá, actualCity)

        actualCity = InfectionCard.findByName("gotá").first!
        XCTAssertEqual(InfectionCard.bogotá, actualCity)
    }
    
}