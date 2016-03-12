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

    /**
     Returns the number of disease cubes of this cities color on this city
     */
    var count:Int {
        return counters[color]!.value
    }

    var redCount:Int {
        return counters[.Red]!.value
    }

    var blueCount:Int {
        return counters[.Blue]!.value
    }

    var blackCount:Int {
        return counters[.Black]!.value
    }

    var yellowCount:Int {
        return counters[.Yellow]!.value
    }

    var redOutbreak:Bool {
        return counters[.Red]!.error
    }

    var blueOutbreak:Bool {
        return counters[.Blue]!.error
    }

    var blackOutbreak:Bool {
        return counters[.Black]!.error
    }

    var yellowOutbreak:Bool {
        return counters[.Yellow]!.error
    }

}