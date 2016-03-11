//
//  DiseaseTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest

@testable import Pandemic

class DiseaseTests: XCTestCase {


    func testIncrementCountOnDefaultDiseaseThenItHasCountOfOne() {
        // arrange
        var disease = Disease()

        // act
        disease.increaseCount()

        // assert
        XCTAssertEqual(disease.count, 1)
    }

    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldStillHave3() {
        // arrange
        var disease = Disease(initialCount: 3)
        
        // act
        disease.increaseCount()

        // assert
        XCTAssertEqual(disease.count, 3)
    }

    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldSignalOutbreak() {
        // arrange 
        var outbreakDetected:Bool = false
        var disease = Disease(initialCount: 3, outbreakMonitor: { outbreakDetected = true })

        // act
        disease.increaseCount()

        // assert
        XCTAssertTrue(outbreakDetected)
    }

    func testDecrementCountOfDiseaseWithCountOf3ThenItHasCountOf2() {
        // arrange
        var disease = Disease(initialCount: 3)

        // act
        disease.decreaseCount()

        // assert
        XCTAssertEqual(disease.count, 2)
    }

    func testDecrementCountOfDiseaseWithCountOfZeroThenItStillHasCountOfZero() {
        // arrange
        var disease = Disease()

        // act
        disease.decreaseCount()

        // assert
        XCTAssertEqual(disease.count, 0)
    }

    func testInitializeDiseaseWithMoreThanCountOfThreeThenTheCountWillBeThree() {
        // act
        let disease = Disease(initialCount: Int.max)

        // assert
        XCTAssertEqual(disease.count, 3)

    }

    func testInitializeDiseaseWithNegativeCountThenTheCountWillBeZero() {
        // act
        let disease = Disease(initialCount: -5)

        // assert
        XCTAssertEqual(disease.count, 0)
    }

    func testResetCountOnDiseaseWithCountOfThreeThenCountWillBeZero() {
        // arrange
        var disease = Disease(initialCount: 3)

        // act
        disease.resetCount()

        // assert
        XCTAssertEqual(disease.count, 0)
    }

}
