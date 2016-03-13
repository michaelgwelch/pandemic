//
//  CharacterTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest

@testable import Pandemic

class RosterBuilderTests : XCTestCase {
    func testCanOnlyHaveOneInstanceOfEachProfession() throws {
        let rosterBuilder = RosterBuilder()
        try rosterBuilder.addPlayerWithCharacterName("Margaret", andProfession: .Scientist)
        do {
            try rosterBuilder.addPlayerWithCharacterName("Tina", andProfession: .Scientist)
            XCTFail("Expected a roster error")
        } catch RosterError.ProfessionAlreadyInUse {

        }
    }

    func test_characters_ReturnsListOfCharactersInOrderCreated() {
        let rosterBuilder = RosterBuilder()
        try! rosterBuilder.addPlayerWithCharacterName("Mike", andProfession: .Medic)
        try! rosterBuilder.addPlayerWithCharacterName("Bill", andProfession: .Dispatcher)

        let chars = rosterBuilder.characters

        XCTAssertEqual(Pandemic.Character(withName: "Mike", andProfession: .Medic), chars[0])
        XCTAssertEqual(Pandemic.Character(withName: "Bill", andProfession: .Dispatcher), chars[1])
        
    }
}

class CharacterTests : XCTestCase {



    func testHashValuesWithSameNameDoNotColllide() {
        let players = [Pandemic.Character(withName: "Tim", andProfession: .Medic),
            Pandemic.Character(withName: "Tim", andProfession: .Dispatcher)]
        let board = GameBoard(withCharacters: players, inCity: City.atlanta)

        XCTAssertEqual(board.characters.count, 2)
    }


}