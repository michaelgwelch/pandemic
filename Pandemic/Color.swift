//
//  Color.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

private let _colors:[Color] = [.Black, .Blue, .Red, .Yellow]

public enum Color {
    case Red
    case Black
    case Yellow
    case Blue

    static var colors:[Color] {
        return _colors
    }

    func notEqual(other:Color) -> Bool {
        return self != other
    }
}