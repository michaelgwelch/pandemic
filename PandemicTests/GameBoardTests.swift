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

    var board:GameBoard = GameBoard()
    var startingCity = City.atlanta
    var characters:[Pandemic.Character] = []

    override func setUp() {
        let builder = GameBoardBuilder()
        try! builder.addPlayerWithName("tim", andProfession: .Medic)
        try! builder.addPlayerWithName("mark", andProfession: .Dispatcher)
        startingCity = City.atlanta
        builder.initialCity = startingCity


        board = builder.createGame()
    }

    func testSetupBoardAllPlayersInInitialCity() {

        board.characters.forEach {
            XCTAssertTrue(board.positionOfCharacter($0)! == startingCity)
        }
    }

    func testFirstPlayerIsFirstPlayerInArray() {
        XCTAssertEqual(board.currentCharacter,
            Pandemic.Character(withName: "tim", andProfession: .Medic))
    }

    func testWhenPlayerPassesTurnMovesToNextPlayer() throws  {
        try board.executeAction(BaseAction.pass)
        let character = board.currentCharacter
        let expectedCharacter = board.characters[1]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenLastPlayerPassesTurnMovesToFirstPlayer() throws {
        // Act
        try board.executeAction(BaseAction.pass)
        try board.executeAction(BaseAction.pass)

        // Assert
        let character = board.currentCharacter
        let expectedCharacter = board.characters[0]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveToMiami() throws {
        // Act
        try board.executeAction(BaseAction.driveOrFerryToCity("Miami"))

        // Assert
        XCTAssertTrue(board.positionOfCharacter(board.currentCharacter)! == City.miami)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveFromAtlantToChicagoThruMiamiWashingtonAndMontreal() throws {
        // Act
        try board.executeAction(BaseAction.driveOrFerryToCity("Miami"))
        try board.executeAction(BaseAction.driveOrFerryToCity("Washington"))
        try board.executeAction(BaseAction.driveOrFerryToCity("Montreal"))
        try board.executeAction(BaseAction.driveOrFerryToCity("Chicago"))

        // Assert
        XCTAssertEqual(board.positionOfCharacter(board.currentCharacter), City.chicago)
    }

    func testDirectFlightWhenPlayerHasCard_ThenPlayerMoves() {

    

    }

}
