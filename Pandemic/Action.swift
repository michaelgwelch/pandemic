//
//  Action.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation



protocol CanTakeAction {
    func execute(board:GameBoard)
}


class Action : CanTakeAction {
    static let pass:CanTakeAction = PassAction()
    static func driveOrFerryToCity(cityName:String) -> CanTakeAction {
        return DriveOrFerryAction(toCityName: cityName)
    }

    func execute(board: GameBoard) {
        //nop
    }

}

class PassAction : Action {
    override func execute(board: GameBoard) {
        board.switchToNextCharacter()
    }
}

class DriveOrFerryAction : Action {
    let cityName:String
    init(toCityName:String) {
        cityName = toCityName
    }
    override func execute(board: GameBoard) {
        board.driveOrFerryTo(cityName)
    }
}