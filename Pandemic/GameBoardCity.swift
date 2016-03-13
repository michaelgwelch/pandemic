//
//  GameBoardCity.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameBoardCity : Equatable {
    public let city:City
    let counters:[Color:DiseaseCounter]

    convenience init(city:City) {
        self.init(city:city, initialCount:0)
    }

    init(city:City, initialCount:Int) {
        self.city = city

        var counters = [Color:DiseaseCounter]()
        counters[.Red] = DiseaseCounter()
        counters[.Yellow] = DiseaseCounter()
        counters[.Black] = DiseaseCounter()
        counters[.Blue] = DiseaseCounter()

        let counter = DiseaseCounter(initialValue: initialCount)

        switch city.color {
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
        counters[city.color]!.increment()
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

    class func outbreakingCity(city:City) -> GameBoardCity {
        let city = GameBoardCity(city: city, initialCount: 3)
        city.infect()
        return city
    }

    // All the cities
    public static let algiers = GameBoardCity(city: City.algiers)
    public static let atlanta = GameBoardCity(city: City.atlanta)
    public static let baghdad = GameBoardCity(city: City.baghdad)
    public static let bangkok = GameBoardCity(city: City.bangkok)
    public static let beijing = GameBoardCity(city: City.beijing)
    public static let bogotá = GameBoardCity(city: City.bogotá)
    public static let buenosaires = GameBoardCity(city: City.buenosaires)
    public static let cairo = GameBoardCity(city: City.cairo)
    public static let chennai = GameBoardCity(city: City.chennai)
    public static let chicago = GameBoardCity(city: City.chicago)
    public static let delhi = GameBoardCity(city: City.delhi)
    public static let essen = GameBoardCity(city: City.essen)
    public static let hochiminhcity = GameBoardCity(city: City.hochiminhcity)
    public static let hongkong = GameBoardCity(city: City.hongkong)
    public static let istanbul = GameBoardCity(city: City.istanbul)
    public static let jakarta = GameBoardCity(city: City.jakarta)
    public static let johannesburg = GameBoardCity(city: City.johannesburg)
    public static let karachi = GameBoardCity(city: City.karachi)
    public static let khartoum = GameBoardCity(city: City.khartoum)
    public static let kinshasa = GameBoardCity(city: City.kinshasa)
    public static let kolkata = GameBoardCity(city: City.kolkata)
    public static let lagos = GameBoardCity(city: City.lagos)
    public static let lima = GameBoardCity(city: City.lima)
    public static let london = GameBoardCity(city: City.london)
    public static let losangeles = GameBoardCity(city: City.losangeles)
    public static let madrid = GameBoardCity(city: City.madrid)
    public static let manila = GameBoardCity(city: City.manila)
    public static let mexicocity = GameBoardCity(city: City.mexicocity)
    public static let miami = GameBoardCity(city: City.miami)
    public static let milan = GameBoardCity(city: City.milan)
    public static let montreal = GameBoardCity(city: City.montreal)
    public static let moscow = GameBoardCity(city: City.moscow)
    public static let mumbai = GameBoardCity(city: City.mumbai)
    public static let newyork = GameBoardCity(city: City.newyork)
    public static let osaka = GameBoardCity(city: City.osaka)
    public static let paris = GameBoardCity(city: City.paris)
    public static let riyadh = GameBoardCity(city: City.riyadh)
    public static let sanfrancisco = GameBoardCity(city: City.sanfrancisco)
    public static let santiago = GameBoardCity(city: City.santiago)
    public static let sãopaulo = GameBoardCity(city: City.sãopaulo)
    public static let seoul = GameBoardCity(city: City.seoul)
    public static let shanghai = GameBoardCity(city: City.shanghai)
    public static let stpetersburg = GameBoardCity(city: City.stpetersburg)
    public static let sydney = GameBoardCity(city: City.sydney)
    public static let taipei = GameBoardCity(city: City.taipei)
    public static let tehran = GameBoardCity(city: City.tehran)
    public static let tokyo = GameBoardCity(city: City.tokyo)
    public static let washington = GameBoardCity(city: City.washington)

    public static var allCities = [algiers, atlanta, baghdad, bangkok, beijing, bogotá, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, sãopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [GameBoardCity] {
        return allCities.findByName(name)
    }
}

extension GameBoardCity : CustomStringConvertible {
    public var description:String {
        return self.city.name
    }
}

extension GameBoardCity : HasCity {

}

public func ==(lhs:GameBoardCity, rhs:GameBoardCity) -> Bool {
    return lhs === rhs
}