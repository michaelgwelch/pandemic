//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

struct DiseaseCount {

    init() {
        self.init(initialValue: 0)
    }

    init(initialValue:Int) {
        value = initialValue
    }

    private var _value = 0

    private(set) var value:Int {
        get {
            return _value
        }

        set (newValue) {
            if newValue > 3 {
                _value = 3
            } else if newValue >= 0 {
                _value = newValue
            }
        }
    }

    mutating func increase() {
        value = value + 1
    }

    mutating func decrease() {
        value = value - 1
    }

    mutating func reset() {
        value = 0
    }
}