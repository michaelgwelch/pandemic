//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class City {
    let name:String
    let color:Color
    let counters:[Color:DiseaseCounter]

    convenience init(name:String, color:Color) {
        self.init(name:name, color:color, initialCount:0)
    }

    init(name:String, color:Color, initialCount:Int) {
        self.name = name
        self.color = color

        var counters = [Color:DiseaseCounter]()
        counters[.Red] = DiseaseCounter()
        counters[.Yellow] = DiseaseCounter()
        counters[.Black] = DiseaseCounter()
        counters[.Blue] = DiseaseCounter()

        let counter = DiseaseCounter(initialValue: initialCount)

        switch color {
        case .Yellow:
            counters[.Yellow] = counter
        case .Red:
            counters[.Red] = counter
        case .Blue:
            counters[.Blue] = counter
        case .Black:
            counters[.Black] = counter
        }

        self.counters = counters
    }

    func infect() {
        counters[color]!.increase()
    }

    public func outbreak(inColor color:Color) -> Bool {
        return counters[color]!.error
    }

    public func diseaseCount(forColor color:Color) -> Int {
        return counters[color]!.value
    }

}