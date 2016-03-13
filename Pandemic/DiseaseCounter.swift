//
//  DiseaseCounter.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

/**
 A simple counter type that knows how to count to 3 but no higher. The counter
 may be incremented or decremented. If decremented the value can never go lower 
 than 0.
 
 - note: This class is meant to encapsulate the counting of disease cubes for a
 single color. Therefore, it can never go higher than 3. However, if the counter
 is incremented when `value` is already 3 then the counter will indicate an error
 state by setting `error` to true. This condition will stay in place until `clearError`
 is called.
 
 - warning: Currently no error is generated if `decrement` is called when the `value`
 is already 0. The counter will simply fail to take any action.
 
 - todo: Consider using a callback instead of using `error` flag to indicate the *outbreak*
 condition of `increment` being called when `value` is already 3. Then the caller would not
 need to check the state of the counter. Also the caller would not need to clear the error.
 Current implementation leaves something to be desired because if `clearError` is never called
 then the `error` flag no longer serves to indicate when a new error condition was encountered.
 
 - todo: Consider throwing an error if `decrement` is called when the `value` is already 0.
 In reality, this would most likely consitute an error in the program. The end user should not
 be allowed to use the *treat* action if there are no disease cubes to treat. If the game
 engine allowed it, that would indicate an error in the engine.
*/
class DiseaseCounter {

    /**
     Construct a DiseaseCounter with an intial value of 0
    */
    convenience init() {
        self.init(initialValue: 0)
    }

    /**
     Construct a DiseaseCounter with an intial value set to `initialValue`.
     */
    init(initialValue:Int) {
        value = initialValue
    }

    private var _value = 0

    /**
     Indicates that `increment` was called when the counter already
     had a value of 3. Call `clearError` to reset this to `false`
    */
    private(set) var error:Bool = false

    /**
     The current value of the counter
    */
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

    /**
     If the current value is less than 3, increment the value by 1.
     
     - note: If the current value is already 3, then the value will be left unchanged
     but the `error` property will be set to `true`.
    */
    func increment() {
        value = value + 1
    }

    /**
     If the current value is greater than 0, decrement the value by 1.

     - note: If the current value is 0, then `decrement` has no effect.
    */
    func decrement() {
        value = value - 1
    }

    /**
     Sets the current value to 0 and sets `error` to false
    */
    func reset() {
        value = 0
        clearError()
    }

    /**
     Creates an instance of DiseaseCounter already in error condition.
     
     - note: This method is for testing purposes only.
    */
    class func _createCounterInError() -> DiseaseCounter {
        let counter = DiseaseCounter(initialValue: 3)
        counter.increment()
        return counter
    }

    /**
     Resets `error` back to false. This is used so that the caller can
     acknowledge the fact that an error occurred and that the counter
     can return to non error state.
     
     - note: This represents a city going from *outbreaking* back to *normal*
     during the course of an infection. The original thought being that if the counter
     went into error, the game engine would know an outbreak happened and after
     dealing with the outbreak reset the counter
    */
    func clearError() {
        error = false
    }
}