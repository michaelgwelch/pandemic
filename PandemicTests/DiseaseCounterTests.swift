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
        let counter = DiseaseCounter()

        // act
        counter.increment()

        // assert
        XCTAssertEqual(counter.value, 1)
    }

    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldStillHave3() {
        // arrange
        let counter = DiseaseCounter(initialValue: 3)
        
        // act
        counter.increment()

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
//        counter.incrementCount()
//
//        // assert
//        XCTAssertTrue(outbreakDetected)
//    }
//
    func testDecrementCountOfDiseaseWithCountOf3ThenItHasCountOf2() {
        // arrange
        let counter = DiseaseCounter(initialValue: 3)

        // act
        counter.decrement()

        // assert
        XCTAssertEqual(counter.value, 2)
    }

    func testDecrementCountOfDiseaseWithCountOfZeroThenItStillHasCountOfZero() {
        // arrange
        let counter = DiseaseCounter()

        // act
        counter.decrement()

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
        let counter = DiseaseCounter(initialValue: 3)

        // act
        counter.reset()

        // assert
        XCTAssertEqual(counter.value, 0)
    }

    func testIncreaseOnACounterWithCountValueOfThreeSetsErrorFlag() {
        // arrange
        let counter = DiseaseCounter(initialValue: 3)

        // act
        counter.increment()

        // assert
        XCTAssertTrue(counter.error)
    }

    func testClearErrorOnCity() {
        // arrange
        let counter = DiseaseCounter._createCounterInError()

        // act
        counter.clearError()

        // assert
        XCTAssertFalse(counter.error)
    }

}
