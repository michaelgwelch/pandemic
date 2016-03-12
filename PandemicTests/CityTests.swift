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
    // If a city has 3 cubes and we treat, it then has 2
    // If a city has 3 cubes and we treat all, it then has 0
    // If I infect a Yellow city with Blue then it has one extra blue cube

    func testCreateCity() {

        // act
        let city = City(name: "Mexico City", color: Color.Yellow)

        // assert
        assertNoDiseaseCubes(city)

    }


    func testInfectCityWithDefaultColor() {
        func infectCity(withCityColor color:Color) {
            // arrange
            let city = City(name: "doesn't matter", color: color)

            // act
            city.infect()

            // assert
            XCTAssertEqual(city.diseaseCount(forColor: color), 1, "The disease count for \(color) was not the expected value of 1")
            for otherColor in Color.colors.filter(color.notEqual) {
                XCTAssertEqual(city.diseaseCount(forColor: otherColor), 0)
            }
        }

        Color.colors.forEach { color in
            infectCity(withCityColor: color)
        }

    }



    func testCityWithThreeCubesWillOutbreakIfInfected() {

        func infectAndCheckForOutbreak(color:Color) {
            let city = City(name: "", color: color, initialCount: 3)
            city.infect()
            XCTAssertTrue(city.outbreak(inColor: color))
            for otherColor in Color.colors.filter(color.notEqual) {
                XCTAssertFalse(city.outbreak(inColor: otherColor))
            }
        }

        Color.colors.forEach { color in
            infectAndCheckForOutbreak(color)
        }

    }


    func assertNoDiseaseCubes(city:City) {

        Color.colors.forEach{
            XCTAssertEqual(city.diseaseCount(forColor: $0), 0)
        }

    }

}
