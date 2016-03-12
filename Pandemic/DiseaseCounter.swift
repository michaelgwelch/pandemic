//
//  DiseaseCounter.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

class DiseaseCounter {

    convenience init() {
        self.init(initialValue: 0)
    }

    init(initialValue:Int) {
        value = initialValue
    }

    private var _value = 0
    private(set) var error:Bool = false

    private(set) var value:Int {
        get {
            return _value
        }

        set (newValue) {
            if newValue > 3 {
                _value = 3
                error = true
            } else if newValue >= 0 {
                _value = newValue
            }
        }
    }

    func increase() {
        value = value + 1
    }

    func decrease() {
        value = value - 1
    }

    func reset() {
        value = 0
    }

    internal class func createCounterInError() -> DiseaseCounter {
        let counter = DiseaseCounter(initialValue: 3)
        counter.increase()
        return counter
    }

    func clearError() {
        error = false
    }
}