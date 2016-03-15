//
//  Character.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

private let _professions:Set<Profession> = [.Medic, .Dispatcher, .Researcher, .Scientist,
    .Generalist]

public enum Profession {
    case Medic
    case Dispatcher
    case Scientist
    case Researcher
    case Generalist

    static var professions:Set<Profession> {
        return _professions
    }
    
}

class RosterBuilder {
    private var usedProfessions:Set<Profession> = []
    private(set) var players:[Player] = []
    func addPlayerWithCharacterName(name:String, andProfession profession:Profession) throws {
        guard !usedProfessions.contains(profession) else {
            let existingPlayer = players.first { $0.characterProfession == profession }
            throw GameError.ProfessionAlreadyInUse(existingPlayer.character)
        }
        guard (players.filter { $0.characterName == name }).count == 0 else {
            let existingPlayer = players.first { $0.characterName == name }
            throw GameError.PlayerNameAlreadyInUse(existingPlayer.character)
        }
        usedProfessions.insert(profession)
        let character = Character(withName: name, andProfession: profession)

        players.append(Player(playingCharacter: character))
    }

    var remainingProfessions:Set<Profession> {
        return Profession.professions.subtract(usedProfessions)
    }

    var validNumberOfPlayers:Bool {
        return players.count > 1 && players.count < 5
    }

}


public struct Character {


    let name:String
    let profession:Profession

    init(withName name:String, andProfession profession:Profession) {

        self.name = name
        self.profession = profession
    }



}

extension Character : Equatable {
}

public func ==(lhs:Character, rhs:Character) -> Bool {
    return lhs.name == rhs.name && lhs.profession == rhs.profession
}

extension Character : Hashable {
    public var hashValue:Int {
        return self.name.hashValue + 13 * self.profession.hashValue
    }
}




