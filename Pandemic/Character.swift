//
//  Character.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

enum Profession {
    case Medic
    case Dispatcher
    case Scientist
    case Researcher
    case Generalist
}

struct Character {

    private static var _createdChars:Set<Profession> = Set<Profession>()

    /**
     Character remember what professions have been used. Clear roster clears
     the list of used professions so a new game can be played.
    */
    static func clearRoster() {
        _createdChars.removeAll()
    }

    let name:String
    let profession:Profession

    init?(withName name:String, andProfession profession:Profession) {
        guard !Character._createdChars.contains(profession) else {
            return nil
        }
        Character._createdChars.insert(profession)
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



