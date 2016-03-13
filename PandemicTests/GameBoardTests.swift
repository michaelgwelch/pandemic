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
            XCTAssertTrue(board.positionOfCharacter($0)! == startingCity)
        }
    }

    func testFirstPlayerIsFirstPlayerInArray() {
        XCTAssertEqual(board.currentCharacter, characters[0])
    }

    func testWhenPlayerPassesTurnMovesToNextPlayer() throws  {
        try board.executeAction(Action.pass)
        let character = board.currentCharacter
        let expectedCharacter = board.characters[1]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenLastPlayerPassesTurnMovesToFirstPlayer() throws {
        // Act
        try board.executeAction(Action.pass)
        try board.executeAction(Action.pass)

        // Assert
        let character = board.currentCharacter
        let expectedCharacter = board.characters[0]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveToMiami() throws {
        // Act
        try board.executeAction(Action.driveOrFerryToCity("Miami"))

        // Assert
        XCTAssertTrue(board.positionOfCharacter(board.currentCharacter)! == City.miami)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveFromAtlantToChicagoThruMiamiWashingtonAndMontreal() throws {
        // Act
        try board.executeAction(Action.driveOrFerryToCity("Miami"))
        try board.executeAction(Action.driveOrFerryToCity("Washington"))
        try board.executeAction(Action.driveOrFerryToCity("Montreal"))
        try board.executeAction(Action.driveOrFerryToCity("Chicago"))

        // Assert
        XCTAssertEqual(board.positionOfCharacter(board.currentCharacter), City.chicago)
    }

    override func tearDown() {
        Pandemic.Character.clearRoster()
    }
}
