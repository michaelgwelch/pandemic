//
//  Player.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class Player {
    static let DefaultHandLimit = 7

    let handLimit:Int
    public let character:Character
    private(set) public var cards:[PlayerCard] = []

    public var characterName:String {
        return character.name
    }

    public var characterProfession:Profession {
        return character.profession
    }


    init(playingCharacter:Character) {
        self.character = playingCharacter
        self.handLimit = Player.DefaultHandLimit
    }

    func dealCard(card:PlayerCard) {
        cards.append(card)
    }
}