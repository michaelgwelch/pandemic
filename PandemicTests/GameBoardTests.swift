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
        let characters = [Pandemic.Character.medic(withName: "tim"),
            Pandemic.Character.dispatcher(withName: "mark")]
        let city = City.atlanta
        let board = GameBoard(withCharacters: characters, inCity:city)

        characters.forEach {
            XCTAssertTrue(board.positionOfCharacter($0)! === city)
        }
    }
}
