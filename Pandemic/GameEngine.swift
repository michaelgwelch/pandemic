//
//  GameEngine.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameEngineBuilder {

    public init() {

    }
    let rosterBuilder = RosterBuilder()
    public var initialCity = GameBoardCity.atlanta

    public func addPlayerWithName(name:String, andProfession profession:Profession) throws {
        try rosterBuilder.addPlayerWithCharacterName(name, andProfession: profession)
    }

    public func createGame() -> GameEngine {
        let players = rosterBuilder.characters.map { Player(playingCharacter: $0) }
        let board = GameBoard(withCharacters: rosterBuilder.characters, inCity: initialCity)
        return GameEngine(withPlayers: players, andBoard: board)
    }

}


public class GameEngine {

    public let players:[Player]
    private(set) public var currentPlayerIndex:Int
    public let board:GameBoard



    private init(withPlayers:[Player], andBoard:GameBoard) {
        self.players = withPlayers
        self.currentPlayerIndex = 0
        self.board = andBoard
    }




}