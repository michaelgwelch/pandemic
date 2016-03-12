//
//  GameBoard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameBoard {

    private var positions:[Pandemic.Character:City]

    init(withCharacters characters:[Pandemic.Character], inCity city:City) {
        positions = [Character:City](tuples: characters.map { ($0, city) })
        self.characters = characters
        self._currentCharacterIndex = self.characters.startIndex
    }

    // TODO: Change this to return City. The Controller that we create
    // can validate that all methods input by user are valid before calling
    // into GameBoard.
    func positionOfCharacter(character:Character) -> City? {
        return positions[character]
    }

    private(set) var characters:[Character]
    private var _currentCharacterIndex:Array<Character>.Index

    var currentCharacter:Character {
        return characters[_currentCharacterIndex]
    }

    func executeAction(action:CanTakeAction) {
        action.execute(self)
    }

    func switchToNextCharacter() {
        _currentCharacterIndex = _currentCharacterIndex.successor()
        if _currentCharacterIndex == characters.endIndex {
            _currentCharacterIndex = characters.startIndex
        } 
    }

    func driveOrFerryTo(cityName:String) {
        positions[self.currentCharacter] = City.miami
    }
}

extension Dictionary {
    init(tuples:[(Key, Value)]) {
        var dictionary = [Key:Value]()
        tuples.forEach { (key, value) in dictionary[key] = value }
        self = dictionary
    }
}