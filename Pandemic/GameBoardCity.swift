//
//  GameBoardCity.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameBoardCity : Equatable {
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
        counters[color]!.increment()
    }

    func isOutbreakingInColor(color:Color) -> Bool {
        return counters[color]!.error
    }

    func diseaseCountForColor(color:Color) -> Int {
        return counters[color]!.value
    }

    func treatColor(color:Color) {
        counters[color]!.decrement()
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

    class func outbreakingCityWithName(name:String, color:Color) -> GameBoardCity {
        let city = GameBoardCity(name: name, color: color, initialCount: 3)
        city.infect()
        return city
    }

    // All the cities
    public static let algiers = GameBoardCity(name: "Algiers", color: .Black)
    public static let atlanta = GameBoardCity(name: "Atlanta", color: .Blue)
    public static let baghdad = GameBoardCity(name: "Baghdad", color: .Black)
    public static let bangkok = GameBoardCity(name: "Bangkok", color: .Red)
    public static let beijing = GameBoardCity(name: "Beijing", color: .Red)
    public static let bogotá = bogota
    public static let bogota = GameBoardCity(name: "Bogotá", color: .Yellow)
    public static let buenosaires = GameBoardCity(name: "Buenos Aires", color: .Yellow)
    public static let cairo = GameBoardCity(name: "Cairo", color: .Black)
    public static let chennai = GameBoardCity(name: "Chennai", color: .Black)
    public static let chicago = GameBoardCity(name: "Chicago", color: .Blue)
    public static let delhi = GameBoardCity(name: "Delhi", color: .Black)
    public static let essen = GameBoardCity(name: "Essen", color: .Blue)
    public static let hochiminhcity = GameBoardCity(name: "Ho Chi Minh City", color: .Red)
    public static let hongkong = GameBoardCity(name: "Hong Kong", color: .Red)
    public static let istanbul = GameBoardCity(name: "Istanbul", color: .Black)
    public static let jakarta = GameBoardCity(name: "Jakarta", color: .Red)
    public static let johannesburg = GameBoardCity(name: "Johannesburg", color: .Yellow)
    public static let karachi = GameBoardCity(name: "Karachi", color: .Black)
    public static let khartoum = GameBoardCity(name: "Khartoum", color: .Yellow)
    public static let kinshasa = GameBoardCity(name: "Kinshasa", color: .Yellow)
    public static let kolkata = GameBoardCity(name: "Kolkata", color: .Black)
    public static let lagos = GameBoardCity(name: "Lagos", color: .Yellow)
    public static let lima = GameBoardCity(name: "Lima", color: .Yellow)
    public static let london = GameBoardCity(name: "London", color: .Blue)
    public static let losangeles = GameBoardCity(name: "Los Angeles", color: .Yellow)
    public static let madrid = GameBoardCity(name: "Madrid", color: .Blue)
    public static let manila = GameBoardCity(name: "Manila", color: .Red)
    public static let mexicocity = GameBoardCity(name: "Mexico City", color: .Yellow)
    public static let miami = GameBoardCity(name: "Miami", color: .Yellow)
    public static let milan = GameBoardCity(name: "Milan", color: .Blue)
    public static let montreal = GameBoardCity(name: "Montreal", color: .Blue)
    public static let moscow = GameBoardCity(name: "Moscow", color: .Black)
    public static let mumbai = GameBoardCity(name: "Mumbai", color: .Black)
    public static let newyork = GameBoardCity(name: "New York", color: .Blue)
    public static let osaka = GameBoardCity(name: "Osaka", color: .Red)
    public static let paris = GameBoardCity(name: "Paris", color: .Blue)
    public static let riyadh = GameBoardCity(name: "Riyadh", color: .Black)
    public static let sanfrancisco = GameBoardCity(name: "San Francisco", color: .Blue)
    public static let santiago = GameBoardCity(name: "Santiago", color: .Yellow)
    public static let sãopaulo = saopaulo
    public static let saopaulo = GameBoardCity(name: "São Paulo", color: .Yellow)
    public static let seoul = GameBoardCity(name: "Seoul", color: .Red)
    public static let shanghai = GameBoardCity(name: "Shanghai", color: .Red)
    public static let stpetersburg = GameBoardCity(name: "St Petersburg", color: .Blue)
    public static let sydney = GameBoardCity(name: "Sydney", color: .Red)
    public static let taipei = GameBoardCity(name: "Taipei", color: .Red)
    public static let tehran = GameBoardCity(name: "Tehran", color: .Black)
    public static let tokyo = GameBoardCity(name: "Tokyo", color: .Red)
    public static let washington = GameBoardCity(name: "Washington", color: .Blue)

    public static var allCities = [algiers, atlanta, baghdad, bangkok, beijing, bogota, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, saopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [GameBoardCity] {
        return allCities.findByName(name)
    }
}

extension GameBoardCity : CustomStringConvertible {
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

extension GameBoardCity : CityRepresentation {
    
}

public func ==(lhs:GameBoardCity, rhs:GameBoardCity) -> Bool {
    return lhs === rhs
}