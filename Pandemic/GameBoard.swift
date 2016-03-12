//
//  GameBoard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameBoard {

    private let positions:[Pandemic.Character:City]

    init(withCharacters characters:[Pandemic.Character], inCity city:City) {
        positions = [Character:City](tuples: characters.map { ($0, city) })
        self.characters = characters
        self._currentCharacterIndex = self.characters.startIndex
    }

    func positionOfCharacter(character:Character) -> City? {
        return positions[character]
    }

    private(set) var characters:[Character]
    private var _currentCharacterIndex:Array<Character>.Index

    var currentCharacter:Character {
        return characters[_currentCharacterIndex]
    }
}

extension Dictionary {
    init(tuples:[(Key, Value)]) {
        var dictionary = [Key:Value]()
        tuples.forEach { (key, value) in dictionary[key] = value }
        self = dictionary
    }
}