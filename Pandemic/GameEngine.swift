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
    public var initialCity = City.atlanta

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

    private(set) public var turnNumber:Int
    private(set) public var actionNumber:Int

    public let players:[Player]
    private(set) public var currentPlayerIndex:Int
    public var currentPlayer:Player {
        return players[currentPlayerIndex]
    }
    public let board:GameBoard



    private init(withPlayers:[Player], andBoard:GameBoard) {
        self.players = withPlayers
        self.currentPlayerIndex = 0
        self.board = andBoard
        self.turnNumber = 1
        self.actionNumber = 0
    }

    private func incrementActionNumber() {
        actionNumber += 1
        if actionNumber > 3 {
            nextPlayer()
        }
    }

    private func nextPlayer() {
        currentPlayerIndex = currentPlayerIndex.successor()
        if currentPlayerIndex == players.endIndex {
            currentPlayerIndex = players.startIndex
        }
        actionNumber = 0
        turnNumber += 1
    }

    public func driveOrFerryToCity(cityName:String) throws {
        try BaseAction.driveOrFerryToCity(cityName).execute(self)
        incrementActionNumber()
    }

    

}

extension GameEngine : CustomDebugStringConvertible {

    public var debugDescription:String {
        var description = "Turn \(turnNumber) Actions Taken \(actionNumber): The current player is \(currentPlayer.character.name)\n"
        players.forEach { player in
            let characterAndPosition = "\(player.character.name) the \(player.character.profession) is located in \(board.positionOfCharacter(player.character))"
            description += characterAndPosition + "\n"
        }
        return description
    }
}





///////////////
// Actions below
/////

protocol Action {
    func execute(engine: GameEngine) throws
}


class BaseAction : Action {
    static let pass:Action = PassAction()
    static func driveOrFerryToCity(cityName:String) -> Action {
        return DriveOrFerryAction(toCityName: cityName)
    }

    func execute(engine: GameEngine) throws {
        //nop
    }

}



class PassAction : BaseAction {
    override func execute(engine: GameEngine) {
        engine.nextPlayer()


    }
}

class DriveOrFerryAction : BaseAction {
    let cityName:String
    init(toCityName:String) {
        cityName = toCityName
    }
    override func execute(engine: GameEngine) throws {

        let destinationCity = engine.board.findCityByName(cityName).first!
        try engine.board.driveOrFerryCharacter(engine.currentPlayer.character, toCity:destinationCity)

    }
}

enum ExecutionError : ErrorType {
    case DriveOrFerryCityUnreachable(to:String, from:String)
}