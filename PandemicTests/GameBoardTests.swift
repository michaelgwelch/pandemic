//
//  GameBoard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic

class GameBoardTests: XCTestCase {

    var board:GameBoard = GameBoard(withCharacters: [], inCity: City.atlanta)
    var startingCity = City.atlanta
    var characters:[Pandemic.Character] = []

    override func setUp() {
        characters = [Pandemic.Character(withName: "tim", andProfession: .Medic)!,
            Pandemic.Character(withName: "mark", andProfession: .Dispatcher)!]
        startingCity = City.atlanta
        board = GameBoard(withCharacters: characters, inCity:startingCity)
    }

    func testSetupBoardAllPlayersInInitialCity() {

        board.characters.forEach {
            XCTAssertTrue(board.positionOfCharacter($0)! === startingCity)
        }
    }

    func testFirstPlayerIsFirstPlayerInArray() {
        XCTAssertEqual(board.currentCharacter, characters[characters.startIndex])
    }

    func testWhenPlayerPassesTurnMovesToNextPlayer() {
        board.executeAction(Action.Pass)
        let character = board.currentCharacter
        let expectedCharacter = board.characters.filter { $0.name == "mark" }.first!
        XCTAssertEqual(expectedCharacter, character)
    }

    override func tearDown() {
        Pandemic.Character.clearRoster()
    }
}
