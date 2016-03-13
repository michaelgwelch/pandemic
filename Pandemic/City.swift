//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class City : Equatable {
    public let name:String
    public let color:Color
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
    public static let algiers = City(name: "Algiers", color: .Black)
    public static let atlanta = City(name: "Atlanta", color: .Blue)
    public static let baghdad = City(name: "Baghdad", color: .Black)
    public static let bangkok = City(name: "Bangkok", color: .Red)
    public static let beijing = City(name: "Beijing", color: .Red)
    public static let bogotá = bogota
    public static let bogota = City(name: "Bogotá", color: .Yellow)
    public static let buenosaires = City(name: "Buenos Aires", color: .Yellow)
    public static let cairo = City(name: "Cairo", color: .Black)
    public static let chennai = City(name: "Chennai", color: .Black)
    public static let chicago = City(name: "Chicago", color: .Blue)
    public static let delhi = City(name: "Delhi", color: .Black)
    public static let essen = City(name: "Essen", color: .Blue)
    public static let hochiminhcity = City(name: "Ho Chi Minh City", color: .Red)
    public static let hongkong = City(name: "Hong Kong", color: .Red)
    public static let istanbul = City(name: "Istanbul", color: .Black)
    public static let jakarta = City(name: "Jakarta", color: .Red)
    public static let johannesburg = City(name: "Johannesburg", color: .Yellow)
    public static let karachi = City(name: "Karachi", color: .Black)
    public static let khartoum = City(name: "Khartoum", color: .Yellow)
    public static let kinshasa = City(name: "Kinshasa", color: .Yellow)
    public static let kolkata = City(name: "Kolkata", color: .Black)
    public static let lagos = City(name: "Lagos", color: .Yellow)
    public static let lima = City(name: "Lima", color: .Yellow)
    public static let london = City(name: "London", color: .Blue)
    public static let losangeles = City(name: "Los Angeles", color: .Yellow)
    public static let madrid = City(name: "Madrid", color: .Blue)
    public static let manila = City(name: "Manila", color: .Red)
    public static let mexicocity = City(name: "Mexico City", color: .Yellow)
    public static let miami = City(name: "Miami", color: .Yellow)
    public static let milan = City(name: "Milan", color: .Blue)
    public static let montreal = City(name: "Montreal", color: .Blue)
    public static let moscow = City(name: "Moscow", color: .Black)
    public static let mumbai = City(name: "Mumbai", color: .Black)
    public static let newyork = City(name: "New York", color: .Blue)
    public static let osaka = City(name: "Osaka", color: .Red)
    public static let paris = City(name: "Paris", color: .Blue)
    public static let riyadh = City(name: "Riyadh", color: .Black)
    public static let sanfrancisco = City(name: "San Francisco", color: .Blue)
    public static let santiago = City(name: "Santiago", color: .Yellow)
    public static let sãopaulo = saopaulo
    public static let saopaulo = City(name: "São Paulo", color: .Yellow)
    public static let seoul = City(name: "Seoul", color: .Red)
    public static let shanghai = City(name: "Shanghai", color: .Red)
    public static let stpetersburg = City(name: "St Petersburg", color: .Blue)
    public static let sydney = City(name: "Sydney", color: .Red)
    public static let taipei = City(name: "Taipei", color: .Red)
    public static let tehran = City(name: "Tehran", color: .Black)
    public static let tokyo = City(name: "Tokyo", color: .Red)
    public static let washington = City(name: "Washington", color: .Blue)

    public static var allCities = [algiers, atlanta, baghdad, bangkok, beijing, bogota, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, saopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [City] {
        return allCities.findByName(name)
    }
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

extension City : CityRepresentation {
    
}

public func ==(lhs:City, rhs:City) -> Bool {
    return lhs === rhs
}