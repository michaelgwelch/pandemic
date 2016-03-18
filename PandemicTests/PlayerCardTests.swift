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

    let cards = [CityCard.santiago, CityCard.sãopaulo, CityCard.bogotá, CityCard.sanfrancisco, CityCard.atlanta]

    func testCanFindSanFrancisco() {
        let actualCity = cards.findCityByName("san ").first!

        XCTAssertEqual(CityCard.sanfrancisco, actualCity)
    }

    func testCanFindByAnyMatchingSubstring() {
        let actualCity = cards.findCityByName("anti").first!

        XCTAssertEqual(CityCard.santiago, actualCity)
    }

    func testCanFindSáoPaulo() {
        let actualCity = cards.findCityByName("sao").first!

        XCTAssertEqual(CityCard.sãopaulo, actualCity)


        let actualCity2 = cards.findCityByName("são").first!
        XCTAssertEqual(CityCard.sãopaulo, actualCity2)
    }

    func testCanFindBogotá() {
        var actualCity = cards.findCityByName("bogota").first!
        XCTAssertEqual(CityCard.bogotá, actualCity)

        actualCity = cards.findCityByName("gotá").first!
        XCTAssertEqual(CityCard.bogotá, actualCity)
    }

}

