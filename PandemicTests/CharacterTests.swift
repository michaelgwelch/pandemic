//
//  CharacterTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest

@testable import Pandemic

class CharacterTests : XCTestCase {
    // Can only create one of each type. Use some sort of static tracker to enforce.

    // Need to implement better hashing, then just on name since names don't have to be unique
    // Can create each character type (First 5 will come from month of January, others will be added later)

    func testCanOnlyHaveOneInstanceOfEachProfession() {
        let _ = Pandemic.Character(withName: "Margaret", andProfession: .Scientist)
        let tina = Pandemic.Character(withName: "Tina", andProfession: .Scientist)
        XCTAssertNil(tina)
    }

    func testHashValuesWithSameNameDoNotColllide() {
        let players = [Pandemic.Character(withName: "Tim", andProfession: .Medic)!,
            Pandemic.Character(withName: "Tim", andProfession: .Dispatcher)!]
        let board = GameBoard(withCharacters: players, inCity: City.atlanta)

        XCTAssertEqual(board.characters.count, 2)
    }

    override func tearDown() {
        Pandemic.Character.clearRoster()
    }
}