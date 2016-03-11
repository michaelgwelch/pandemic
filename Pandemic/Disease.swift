//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/10/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

struct Disease {
    private static let greaterThanThree = 4...Int.max

    init() {
        self.init(initialCount: 0, outbreakMonitor: {})
    }

    init(initialCount:Int) {
        self.init(initialCount:initialCount, outbreakMonitor: {})
    }

    init(initialCount:Int, outbreakMonitor:() -> ()) {
        self.outbreakMonitor = outbreakMonitor
        count = initialCount
    }

    private(set) var _count = 0

    private(set) var count:Int {
        get {
            return _count
        }
        set (newCount){
            if newCount > 3 {
                _count = 3
                signalOutbreak()
            } else if newCount >= 0 {
                _count = newCount
            }
        }
    }

    private func signalOutbreak() {
        outbreakMonitor()
    }

    let outbreakMonitor:() -> ()

    mutating func increaseCount() -> Void {
        count = count + 1
    }

    mutating func decreaseCount() {
        count = count - 1
    }

    mutating func resetCount() {
        count = 0
    }
}