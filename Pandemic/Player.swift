//
//  Player.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class Player {
    private(set) var cards:Set<PlayerCard> = []

    func dealCard(card:PlayerCard) {
        cards.insert(card)
    }
}