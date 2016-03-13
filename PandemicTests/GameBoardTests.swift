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

    var engine:GameEngine = GameEngineBuilder().createGame()
    var startingCity = GameBoardCity.atlanta
    var characters:[Pandemic.Character] = []

    override func setUp() {
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("tim", andProfession: .Medic)
        try! builder.addPlayerWithName("mark", andProfession: .Dispatcher)
        startingCity = GameBoardCity.atlanta
        builder.initialCity = startingCity


        engine = builder.createGame()
    }

    func testSetupBoardAllPlayersInInitialCity() {

        engine.board.characters.forEach {
            XCTAssertTrue(engine.board.positionOfCharacter($0)! == startingCity)
        }
    }

    func testFirstPlayerIsFirstPlayerInArray() {
        XCTAssertEqual(engine.board.currentCharacter,
            Pandemic.Character(withName: "tim", andProfession: .Medic))
    }

    func testWhenPlayerPassesTurnMovesToNextPlayer() throws  {
        try engine.board.executeAction(BaseAction.pass)
        let character = engine.board.currentCharacter
        let expectedCharacter = engine.board.characters[1]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenLastPlayerPassesTurnMovesToFirstPlayer() throws {
        // Act
        try engine.board.executeAction(BaseAction.pass)
        try engine.board.executeAction(BaseAction.pass)

        // Assert
        let character = engine.board.currentCharacter
        let expectedCharacter = engine.board.characters[0]
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveToMiami() throws {
        // Act
        try engine.board.executeAction(BaseAction.driveOrFerryToCity("Miami"))

        // Assert
        XCTAssertTrue(engine.board.positionOfCharacter(engine.board.currentCharacter)! == GameBoardCity.miami)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveFromAtlantToChicagoThruMiamiWashingtonAndMontreal() throws {
        // Act
        try engine.board.executeAction(BaseAction.driveOrFerryToCity("Miami"))
        try engine.board.executeAction(BaseAction.driveOrFerryToCity("Washington"))
        try engine.board.executeAction(BaseAction.driveOrFerryToCity("Montreal"))
        try engine.board.executeAction(BaseAction.driveOrFerryToCity("Chicago"))

        // Assert
        XCTAssertEqual(engine.board.positionOfCharacter(engine.board.currentCharacter), GameBoardCity.chicago)
    }

    func testDirectFlightWhenPlayerHasCard_ThenPlayerMoves() {

    

    }

}
