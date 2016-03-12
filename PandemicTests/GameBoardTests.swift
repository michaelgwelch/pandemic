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

    func testSetupBoardAllPlayersInInitialCity() {
        let characters = [Pandemic.Character(withName: "tim", andProfession: .Medic)!,
            Pandemic.Character(withName: "mark", andProfession: .Dispatcher)!]
        let city = City.atlanta
        let board = GameBoard(withCharacters: characters, inCity:city)

        characters.forEach {
            XCTAssertTrue(board.positionOfCharacter($0)! === city)
        }
    }

    override func tearDown() {
        Pandemic.Character.clearRoster()
    }
}
