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

    var engine:GameEngine = GameEngineBuilder().createGameEngine()
    var startingCity = City.atlanta
    var characters:[Pandemic.Character] = []

    override func setUp() {
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("tim", andProfession: .Medic)
        try! builder.addPlayerWithName("mark", andProfession: .Dispatcher)
        startingCity = City.atlanta
        builder.initialCity = startingCity


        engine = builder.createGameEngine()
    }

    func testSetupBoardAllPlayersInInitialCity() {

        engine.board.positions.forEach { tuple in
            XCTAssertTrue(engine.board.positionOfCharacter(tuple.0).name == startingCity.name)
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
        XCTAssertTrue(engine.board.positionOfCharacter(engine.currentPlayer.character).name == City.miami.name)
    }

    func testWhenPlayerIsInAtlantaHeCanDriveFromAtlantToChicagoThruMiamiWashingtonAndMontreal() throws {
        // Act
        try BaseAction.driveOrFerryToCity("Miami").execute(engine)
        try BaseAction.driveOrFerryToCity("Wash").execute(engine)
        try BaseAction.driveOrFerryToCity("Mont").execute(engine)
        try BaseAction.driveOrFerryToCity("Chicago").execute(engine)

        // Assert
        XCTAssertEqual(engine.board.positionOfCharacter(engine.currentPlayer.character).name, City.chicago.name)
    }

    func testDirectFlightWhenPlayerHasCard_ThenPlayerMoves() {

    

    }

}

public class GameEngineBuilderTests : XCTestCase {


    func testInfectCityWithThreeCubes() {
        let builder = GameEngineBuilder()
        builder.infectCity(City.miami, withQuantityOfCubes:3)
        XCTAssertEqual(3, builder.diseaseCubesForCity(City.miami))
    }

    func testCreateGameReturnsNilIfInitialInfectionsNotDoneCorrectly() {
        // arrange
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("Mark", andProfession: .Scientist)
        try! builder.addPlayerWithName("Mike", andProfession: .Generalist)
        let engine = builder.createGame()

        XCTAssertNil(engine)
    }

    func testCreateGameReturnsEngineIfInitialInfectionsDoneCorrectly() {
        // arrange
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("Mark", andProfession: .Scientist)
        try! builder.addPlayerWithName("Mike", andProfession: .Generalist)
        infectBuilder(builder)
        let engine = builder.createGame()

        XCTAssertNotNil(engine)
    }

    func testCreateGameReturnsNilIfLessThanTwoPlayers() {
        // arrange
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("Mark", andProfession: .Scientist)
        infectBuilder(builder)
        let engine = builder.createGame()

        XCTAssertNil(engine)
    }

    func testCreateGameReturnsNilIfMoreThanFourPlayers() {
        let builder = GameEngineBuilder()
        try! builder.addPlayerWithName("Mark", andProfession: .Scientist)
        try! builder.addPlayerWithName("Tom", andProfession: .Generalist)
        try! builder.addPlayerWithName("Tina", andProfession: .Medic)
        try! builder.addPlayerWithName("Margaret", andProfession: .Dispatcher)
        try! builder.addPlayerWithName("Hal", andProfession: .Researcher)
        infectBuilder(builder)

        XCTAssertNil(builder.createGame())


    }

    private func infectBuilder(builder:GameEngineBuilder) {
        builder.infectCity(City.montreal, withQuantityOfCubes: 3)
        builder.infectCity(City.jakarta, withQuantityOfCubes: 3)
        builder.infectCity(City.atlanta, withQuantityOfCubes: 3)
        builder.infectCity(City.baghdad, withQuantityOfCubes: 2)
        builder.infectCity(City.newyork, withQuantityOfCubes: 2)
        builder.infectCity(City.miami, withQuantityOfCubes: 2)
        builder.infectCity(City.hochiminhcity, withQuantityOfCubes: 1)
        builder.infectCity(City.chennai, withQuantityOfCubes: 1)
        builder.infectCity(City.santiago, withQuantityOfCubes: 1)
    }

}
