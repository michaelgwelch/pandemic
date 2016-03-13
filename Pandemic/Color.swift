//
//  Color.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

private let _colors:[Color] = [.Black, .Blue, .Red, .Yellow]

/**
 The colors used to describe cities and diseases.
*/
public enum Color {
    case Red
    case Black
    case Yellow
    case Blue

    /**
     The collection of all `Color` values
    */
    static var colors:[Color] {
        return _colors
    }

    /**
     Returns `true` if `self` is a value different from `other`
     
     - parameter other: The other value to compare to
     
     - note: This is just a convenience for use in lambda expressions because Swift does not yet (as
             far as I know) provide a way to create sections out of operators like `!=`
    */
    @warn_unused_result
    func notEqual(other:Color) -> Bool {
        return self != other
    }
}