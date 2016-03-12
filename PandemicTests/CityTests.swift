//
//  CityTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic
class CityTests: XCTestCase {



    // Test cases
    // Default city has a disease count of zero for every color disease
    // If a city has zero cubes of a color and we infect it with that color, it now has 1
    // If a city has one cube of a color and we infect, then it has 2
    // If a city has three cubes of a color and we infect it with that color, then it goes into outbreak state and still has 3 cubes.
    // If a city is outbreaking and we reset outbreak status, then it is no longer outbreaking.

    func testCreateCity() {
        // act
        let city = City(name: "Mexico City", color: Color.Yellow)

        // assert
        assertNoDiseaseCubes(city)

    }

    func testInfectCity() {
        // arrange
        let yellow = City(name: "Mexico City", color: Color.Yellow)
        let red = City(name: "Shanghai", color: Color.Red)
        let blue = City(name: "New York", color: .Blue)
        let black = City(name: "Chennai", color: .Black)

        // act
        yellow.infect()
        red.infect()
        black.infect()
        blue.infect()

        // assert
        XCTAssertEqual(yellow.yellowCount, 1)
        XCTAssertEqual(black.blackCount, 1)
        XCTAssertEqual(blue.blueCount, 1)
        XCTAssertEqual(red.redCount, 1)
    }

    func assertCityWithThreeCubesWillOutbreakIfInfected() {
        // arrange
        let yellow = City(name: "Mexico City", color: Color.Yellow, initialCount:3)
        let red = City(name: "Shanghai", color: Color.Red, initialCount:3)
        let blue = City(name: "New York", color: .Blue, initialCount:3)
        let black = City(name: "Chennai", color: .Black, initialCount:3)

        // act
        yellow.infect()
        red.infect()
        black.infect()
        blue.infect()

        // assert
        XCTAssertTrue(yellow.yellowOutbreak)
        XCTAssertTrue(red.redOutbreak)
        XCTAssertTrue(blue.blueOutbreak)
        XCTAssertTrue(black.blackOutbreak)
    }


    func assertNoDiseaseCubes(city:City) {
        XCTAssertEqual(city.redCount, 0, "Red count is not zero")
        XCTAssertEqual(city.blueCount, 0, "Blue count is not zero")
        XCTAssertEqual(city.yellowCount, 0, "Yellow count is not zero")
        XCTAssertEqual(city.blackCount, 0, "Black count is not zero")
    }

}
