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
    private(set) var characters:[Character] = []
    func addPlayerWithCharacterName(name:String, andProfession profession:Profession) throws {
        guard !usedProfessions.contains(profession) else {
            throw RosterError.ProfessionAlreadyInUse
        }
        usedProfessions.insert(profession)
        characters.append(Character(withName: name, andProfession: profession))
    }

    var remainingProfessions:Set<Profession> {
        return Profession.professions.subtract(usedProfessions)
    }

    var validNumberOfPlayers:Bool {
        return characters.count > 1 && characters.count < 5
    }

}

enum RosterError : ErrorType {
    case ProfessionAlreadyInUse
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




