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

    func test_remainingProfessions_InitiallyHasAllProfessions() {
        let rosterBuilder = RosterBuilder()
        let expectedProfessions:Set<Profession> = [.Medic,
            .Dispatcher, .Scientist, .Researcher, .Generalist]

        XCTAssertEqual(expectedProfessions, rosterBuilder.remainingProfessions)
    }

    func testCanOnlyHaveOneInstanceOfEachProfession() throws {
        let rosterBuilder = RosterBuilder()
        try rosterBuilder.addPlayerWithCharacterName("Margaret", andProfession: .Scientist)
        do {
            try rosterBuilder.addPlayerWithCharacterName("Tina", andProfession: .Scientist)
            XCTFail("Expected a roster error")
        } catch GameError.ProfessionAlreadyInUse {

        }
    }

    func test_characters_ReturnsListOfCharactersInOrderCreated() {
        let rosterBuilder = RosterBuilder()
        try! rosterBuilder.addPlayerWithCharacterName("Mike", andProfession: .Medic)
        try! rosterBuilder.addPlayerWithCharacterName("Bill", andProfession: .Dispatcher)

        let players = rosterBuilder.players

        XCTAssertEqual(Pandemic.Character(withName: "Mike", andProfession: .Medic), players[0].character)
        XCTAssertEqual(Pandemic.Character(withName: "Bill", andProfession: .Dispatcher), players[1].character)
        
    }
}

class CharacterTests : XCTestCase {



    func testHashValuesWithSameNameDoNotColllide() {
        let players:Set<Pandemic.Character> = [Pandemic.Character(withName: "Tim", andProfession: .Medic),
            Pandemic.Character(withName: "Tim", andProfession: .Dispatcher)]

        XCTAssertEqual(players.count, 2)
    }


}