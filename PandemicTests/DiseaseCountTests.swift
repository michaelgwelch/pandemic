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
        var disease = DiseaseCount()

        // act
        disease.increase()

        // assert
        XCTAssertEqual(disease.value, 1)
    }

    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldStillHave3() {
        // arrange
        var disease = DiseaseCount(initialValue: 3)
        
        // act
        disease.increase()

        // assert
        XCTAssertEqual(disease.value, 3)
    }
//
//    func testIncrementCountOnADiseaseThatHasCountOf3ThenItShouldSignalOutbreak() {
//        // arrange 
//        var outbreakDetected:Bool = false
//        var disease = Disease(initialValue: 3, outbreakMonitor: { outbreakDetected = true })
//
//        // act
//        disease.increaseCount()
//
//        // assert
//        XCTAssertTrue(outbreakDetected)
//    }
//
    func testDecrementCountOfDiseaseWithCountOf3ThenItHasCountOf2() {
        // arrange
        var disease = DiseaseCount(initialValue: 3)

        // act
        disease.decrease()

        // assert
        XCTAssertEqual(disease.value, 2)
    }

    func testDecrementCountOfDiseaseWithCountOfZeroThenItStillHasCountOfZero() {
        // arrange
        var disease = DiseaseCount()

        // act
        disease.decrease()

        // assert
        XCTAssertEqual(disease.value, 0)
    }

    func testInitializeDiseaseWithMoreThanCountOfThreeThenTheCountWillBeThree() {
        // act
        let disease = DiseaseCount(initialValue: Int.max)

        // assert
        XCTAssertEqual(disease.value, 3)

    }

    func testInitializeDiseaseWithNegativeCountThenTheCountWillBeZero() {
        // act
        let disease = DiseaseCount(initialValue: -5)

        // assert
        XCTAssertEqual(disease.value, 0)
    }

    func testResetCountOnDiseaseWithCountOfThreeThenCountWillBeZero() {
        // arrange
        var disease = DiseaseCount(initialValue: 3)

        // act
        disease.reset()

        // assert
        XCTAssertEqual(disease.value, 0)
    }

}
