//
//  Character.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation


struct Character {

    // Can only create one of each type. Use some sort of static tracker to enforce.

    // Need to implement better hashing, then just on name since names don't have to be unique

    let name:String

    private init(name:String) {
        self.name = name
    }

    static func medic(withName name:String) -> Character {
        return Character(name: name)
    }

    static func dispatcher(withName name:String) -> Character {
        return Character(name: name)
    }

}

extension Character : Equatable {
}

func ==(lhs:Character, rhs:Character) -> Bool {
    return lhs.name == rhs.name
}

extension Character : Hashable {
    var hashValue:Int { return self.name.hashValue }
}



