//
//  Character.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public enum Profession {
    case Medic
    case Dispatcher
    case Scientist
    case Researcher
    case Generalist
}

public class RosterBuilder {
    private var professions:Set<Profession> = []
    private(set) var characters:[Character] = []
    public func addPlayerWithCharacterName(name:String, andProfession profession:Profession) throws {
        guard !professions.contains(profession) else {
            throw RosterError.ProfessionAlreadyInUse
        }
        professions.insert(profession)
        characters.append(Character(withName: name, andProfession: profession))
    }

}

public enum RosterError : ErrorType {
    case ProfessionAlreadyInUse
}
/*
public class GameBoardBuilder {

var characters:[Character] = []

public func addPlayerWithCharacterName(name:String, andProfession profession:Profession) {
characters.append(Character(withName: name, andProfession: profession))
}


}
*/

struct Character {


    let name:String
    let profession:Profession

    init(withName name:String, andProfession profession:Profession) {

        self.name = name
        self.profession = profession
    }



}

extension Character : Equatable {
}

func ==(lhs:Character, rhs:Character) -> Bool {
    return lhs.name == rhs.name && lhs.profession == rhs.profession
}

extension Character : Hashable {
    var hashValue:Int {
        return self.name.hashValue + 13 * self.profession.hashValue
    }
}



