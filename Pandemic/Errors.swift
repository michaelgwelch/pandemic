//
//  GameEngineError.swift
//  Pandemic
//
//  Created by Michael Welch on 3/15/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public enum GameError : ErrorType {
    case UnknownPlayerName(String)
    case UnknownCityName(String)
    case ProfessionAlreadyInUse(Character)
    case PlayerNameAlreadyInUse(Character)

    // Action errors
    case DriveOrFerryCityUnreachable(to:String, from:String)
}

