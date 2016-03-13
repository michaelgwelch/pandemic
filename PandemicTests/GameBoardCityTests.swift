//
//  GameBoardCityTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic
class GameBoardCityTests: XCTestCase {


    // Test cases
    // Default city has a disease count of zero for every color disease
    // If a city has zero cubes of a color and we infect it with that color, it now has 1
    // If a city has one cube of a color and we infect, then it has 2
    // If a city has three cubes of a color and we infect it with that color, then it goes into outbreak state and still has 3 cubes.
    // If a city is outbreaking and we reset outbreak status, then it is no longer outbreaking.
    // If a city has 3 cubes and we treat, it then has 2
    // If a city has 3 cubes and we treat all, it then has 0
    // If I infect a Yellow city with Blue then it has one extra blue cube

    func testCreateCity() {

        // act
        let city = GameBoardCity(city: City.mexicocity)

        // assert
        assertNoDiseaseCubes(city)

    }


    func testInfectCityWithDefaultColor() {
        func infectCity(city:City) {
            // arrange
            let city = GameBoardCity(city: city)

            // act
            city.infect()

            // assert
            XCTAssertEqual(city.diseaseCountForColor(city.city.color), 1, "The disease count for \(city.city.name) was not the expected value of 1")
            for otherColor in Color.colors.filter(city.city.color.notEqual) {
                XCTAssertEqual(city.diseaseCountForColor(otherColor), 0)
            }
        }

        // Infect one city of each color
        infectCity(City.atlanta)
        infectCity(City.mexicocity)
        infectCity(City.jakarta)
        infectCity(City.chennai)


    }



    func testCityWithThreeCubesWillOutbreakIfInfected() {

        func infectCityAndCheckForOutbreak(city:City) {
            let gameBoardCity = GameBoardCity(city: city, initialCount: 3)
            gameBoardCity.infect()
            XCTAssertTrue(gameBoardCity.isOutbreakingInColor(city.color))
            for otherColor in Color.colors.filter(city.color.notEqual) {
                XCTAssertFalse(gameBoardCity.isOutbreakingInColor(otherColor))
            }
        }

        // Infect one city of each color
        infectCityAndCheckForOutbreak(City.atlanta)
        infectCityAndCheckForOutbreak(City.mexicocity)
        infectCityAndCheckForOutbreak(City.jakarta)
        infectCityAndCheckForOutbreak(City.chennai)
    }


    func assertNoDiseaseCubes(city:GameBoardCity) {

        Color.colors.forEach{
            XCTAssertEqual(city.diseaseCountForColor($0), 0)
        }

    }

    func testTreatCityWith3CubesThenItWillHave2() {
        let city = GameBoardCity(city: City.chennai, initialCount: 3)
        city.treatColor(.Black)
        XCTAssertEqual(city.diseaseCountForColor(.Black), 2)

    }

    func testTreatAllInCityWith3CubesThenItWillHave0() {
        let city = GameBoardCity(city: City.hochiminhcity, initialCount: 3)
        city.treatAllColor(.Black)
        XCTAssertEqual(city.diseaseCountForColor(.Black), 0)
    }


    func testResetOutbreakingCityThenItIsNoLongerOutbreaking() {
        let city = GameBoardCity.outbreakingCity(City.stpetersburg)
        city.clearOutbreak()
        XCTAssertFalse(city.isOutbreakingInColor(.Black))
    }


}
