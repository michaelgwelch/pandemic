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
    static let algiers = City(name: "Algiers", color: .Black)
    static let atlanta = City(name: "Atlanta", color: .Blue)
    static let baghdad = City(name: "Baghdad", color: .Black)
    static let bangkok = City(name: "Bangkok", color: .Red)
    static let beijing = City(name: "Beijing", color: .Red)
    static let bogota = City(name: "Bogota", color: .Yellow)
    static let buenosaires = City(name: "Buenos Aires", color: .Yellow)
    static let cairo = City(name: "Cairo", color: .Black)
    static let chennai = City(name: "Chennai", color: .Black)
    static let chicago = City(name: "Chicago", color: .Blue)
    static let delhi = City(name: "Delhi", color: .Black)
    static let essen = City(name: "Essen", color: .Blue)
    static let hochiminhcity = City(name: "Ho Chi Minh City", color: .Red)
    static let hongkong = City(name: "Hong Kong", color: .Red)
    static let istanbul = City(name: "Istanbul", color: .Black)
    static let jakarta = City(name: "Jakarta", color: .Red)
    static let johannesburg = City(name: "Johannesburg", color: .Yellow)
    static let karachi = City(name: "Karachi", color: .Black)
    static let khartoum = City(name: "Khartoum", color: .Yellow)
    static let kinshasa = City(name: "Kinshasa", color: .Yellow)
    static let kolkata = City(name: "Kolkata", color: .Black)
    static let lagos = City(name: "Lagos", color: .Yellow)
    static let lima = City(name: "Lima", color: .Yellow)
    static let london = City(name: "London", color: .Blue)
    static let losangeles = City(name: "Los Angeles", color: .Yellow)
    static let madrid = City(name: "Madrid", color: .Blue)
    static let manila = City(name: "Manila", color: .Red)
    static let mexicocity = City(name: "Mexico City", color: .Yellow)
    static let miami = City(name: "Miami", color: .Yellow)
    static let milan = City(name: "Milan", color: .Blue)
    static let montreal = City(name: "Montreal", color: .Blue)
    static let moscow = City(name: "Moscow", color: .Black)
    static let mumbai = City(name: "Mumbai", color: .Black)
    static let newyork = City(name: "New York", color: .Blue)
    static let osaka = City(name: "Osaka", color: .Red)
    static let paris = City(name: "Paris", color: .Blue)
    static let riyadh = City(name: "Riyadh", color: .Black)
    static let sanfrancisco = City(name: "San Francisco", color: .Blue)
    static let santiago = City(name: "Santiago", color: .Yellow)
    static let saopaulo = City(name: "Sao Paulo", color: .Yellow)
    static let seoul = City(name: "Seoul", color: .Red)
    static let shanghai = City(name: "Shanghai", color: .Red)
    static let stpetersburg = City(name: "St Petersburg", color: .Blue)
    static let sydney = City(name: "Sydney", color: .Red)
    static let taipei = City(name: "Taipei", color: .Red)
    static let tehran = City(name: "Tehran", color: .Black)
    static let tokyo = City(name: "Tokyo", color: .Red)
    static let washington = City(name: "Washington", color: .Blue)

}

extension City : CustomStringConvertible {
    public var description:String {
        if (self.name == "Bogota") {
            return "Bogotá"
        }
        if (self.name == "Sao Paulo") {
            return "São Paulo"
        }
        return self.name
    }
}

public func ==(lhs:City, rhs:City) -> Bool {
    return lhs === rhs
}