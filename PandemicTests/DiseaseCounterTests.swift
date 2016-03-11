//
//  DiseaseCounterTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest

@testable import Pandemic

class DiseaseCounterTests: XCTestCase {


    func testIncrementCountOnDefaultDiseaseThenItHasCountOfOne() {
        // arrange
        var counter = DiseaseCounter()

        // act
        counter.increase()

        // assert
        XCTAssertEqual(counter.value, 1)
    }

    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldStillHave3() {
        // arrange
        var counter = DiseaseCounter(initialValue: 3)
        
        // act
        counter.increase()

        // assert
        XCTAssertEqual(counter.value, 3)
    }
//
//    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldSignalOutbreak() {
//        // arrange 
//        var outbreakDetected:Bool = false
//        var counter = Disease(initialValue: 3, outbreakMonitor: { outbreakDetected = true })
//
//        // act
//        counter.increaseCount()
//
//        // assert
//        XCTAssertTrue(outbreakDetected)
//    }
//
    func testDecrementCountOfDiseaseWithCountOf3ThenItHasCountOf2() {
        // arrange
        var counter = DiseaseCounter(initialValue: 3)

        // act
        counter.decrease()

        // assert
        XCTAssertEqual(counter.value, 2)
    }

    func testDecrementCountOfDiseaseWithCountOfZeroThenItStillHasCountOfZero() {
        // arrange
        var counter = DiseaseCounter()

        // act
        counter.decrease()

        // assert
        XCTAssertEqual(counter.value, 0)
    }

    func testInitializeDiseaseWithMoreThanCountOfThreeThenTheCountWillBeThree() {
        // act
        let counter = DiseaseCounter(initialValue: Int.max)

        // assert
        XCTAssertEqual(counter.value, 3)

    }

    func testInitializeDiseaseWithNegativeCountThenTheCountWillBeZero() {
        // act
        let counter = DiseaseCounter(initialValue: -5)

        // assert
        XCTAssertEqual(counter.value, 0)
    }

    func testResetCountOnDiseaseWithCountOfThreeThenCountWillBeZero() {
        // arrange
        var counter = DiseaseCounter(initialValue: 3)

        // act
        counter.reset()

        // assert
        XCTAssertEqual(counter.value, 0)
    }

}
