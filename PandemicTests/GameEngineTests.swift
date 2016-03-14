//
//  GameEngineTests.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import XCTest
@testable import Pandemic

/// - todo: These tests are now a mishmash of GameBoard and GameEngine. Should
/// straightend out
class GameEngineTests: XCTestCase {

    var engine:GameEngine = GameEngineBuilder().createGame()
    var startingCity = City.atlanta
    var characters:[Pandemic.Character] = []

    override func setUp() {
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("tim", andProfession: .Medic)
        try! builder.addPlayerWithName("mark", andProfession: .Dispatcher)
        startingCity = City.atlanta
        builder.initialCity = startingCity


        engine = builder.createGame()
    }

    func testSetupBoardAllPlayersInInitialCity() {

        engine.board.positions.forEach { tuple in
            XCTAssertTrue(engine.board.positionOfCharacter(tuple.0).city == startingCity)
        }
    }

    func testFirstPlayerIsFirstPlayerInArray() {
        XCTAssertEqual(engine.currentPlayer.character,
            Pandemic.Character(withName: "tim", andProfession: .Medic))
    }

    func testWhenPlayerPassesTurnMovesToNextPlayer() throws  {
        try BaseAction.pass.execute(engine)
        let character = engine.currentPlayer.character
        let expectedCharacter = engine.players[1].character
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenLastPlayerPassesTurnMovesToFirstPlayer() throws {
        // Act
        try BaseAction.pass.execute(engine)
        try BaseAction.pass.execute(engine)

        // Assert
        let character = engine.currentPlayer.character
        let expectedCharacter = engine.players[0].character
        XCTAssertEqual(expectedCharacter, character)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveToMiami() throws {
        // Act
        try BaseAction.driveOrFerryToCity("Miami").execute(engine)

        // Assert
        XCTAssertTrue(engine.board.positionOfCharacter(engine.currentPlayer.character).city == City.miami)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveFromAtlantToChicagoThruMiamiWashingtonAndMontreal() throws {
        // Act
        try BaseAction.driveOrFerryToCity("Miami").execute(engine)
        try BaseAction.driveOrFerryToCity("Wash").execute(engine)
        try BaseAction.driveOrFerryToCity("Mont").execute(engine)
        try BaseAction.driveOrFerryToCity("Chicago").execute(engine)

        // Assert
        XCTAssertEqual(engine.board.positionOfCharacter(engine.currentPlayer.character).city, City.chicago)
    }

    func testDirectFlightWhenPlayerHasCard_ThenPlayerMoves() {

    

    }

}
