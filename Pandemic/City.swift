//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class City : Equatable {
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

    func isOutbreakingInColor(color:Color) -> Bool {
        return counters[color]!.error
    }

    func diseaseCountForColor(color:Color) -> Int {
        return counters[color]!.value
    }

    func treatColor(color:Color) {
        counters[color]!.decrease()
    }

    func treatAllColor(color:Color) {
        counters[color]!.reset()
    }

    /**
     Clears the outbreak flag.

    */
    func clearOutbreak() {
        Color.colors.forEach { counters[$0]!.clearError() }
    }

    class func outbreakingCityWithName(name:String, color:Color) -> City {
        let city = City(name: name, color: color, initialCount: 3)
        city.infect()
        return city
    }

    // All the cities
    static let atlanta = City(name: "Atlanta", color: .Blue, initialCount: 0)
    static let miami = City(name: "Miami", color: .Yellow, initialCount: 0)
    static let washington = City(name: "Washington", color: .Blue)
    static let montreal = City(name: "Montreal", color: .Blue)
    static let chicago = City(name: "Chicago", color: .Blue)

}

public func ==(lhs:City, rhs:City) -> Bool {
    return lhs === rhs
}