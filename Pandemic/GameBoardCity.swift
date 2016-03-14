//
//  GameBoardCity.swift
//  Pandemic
//
//  Created by Michael Welch on 3/11/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public class GameBoardCityFactory {

    public let algiers = { () in GameBoardCity(city: City.algiers) }
    public let atlanta = { () in GameBoardCity(city: City.atlanta) }
    public let baghdad = { () in GameBoardCity(city: City.baghdad) }
    public let bangkok = { () in GameBoardCity(city: City.bangkok) }
    public let beijing = { () in GameBoardCity(city: City.beijing) }
    public let bogotá = { () in GameBoardCity(city: City.bogotá) }
    public let buenosaires = { () in GameBoardCity(city: City.buenosaires) }
    public let cairo = { () in GameBoardCity(city: City.cairo) }
    public let chennai = { () in GameBoardCity(city: City.chennai) }
    public let chicago = { () in GameBoardCity(city: City.chicago) }
    public let delhi = { () in GameBoardCity(city: City.delhi) }
    public let essen = { () in GameBoardCity(city: City.essen) }
    public let hochiminhcity = { () in GameBoardCity(city: City.hochiminhcity) }
    public let hongkong = { () in GameBoardCity(city: City.hongkong) }
    public let istanbul = { () in GameBoardCity(city: City.istanbul) }
    public let jakarta = { () in GameBoardCity(city: City.jakarta) }
    public let johannesburg = { () in GameBoardCity(city: City.johannesburg) }
    public let karachi = { () in GameBoardCity(city: City.karachi) }
    public let khartoum = { () in GameBoardCity(city: City.khartoum) }
    public let kinshasa = { () in GameBoardCity(city: City.kinshasa) }
    public let kolkata = { () in GameBoardCity(city: City.kolkata) }
    public let lagos = { () in GameBoardCity(city: City.lagos) }
    public let lima = { () in GameBoardCity(city: City.lima) }
    public let london = { () in GameBoardCity(city: City.london) }
    public let losangeles = { () in GameBoardCity(city: City.losangeles) }
    public let madrid = { () in GameBoardCity(city: City.madrid) }
    public let manila = { () in GameBoardCity(city: City.manila) }
    public let mexicocity = { () in GameBoardCity(city: City.mexicocity) }
    public let miami = { () in GameBoardCity(city: City.miami) }
    public let milan = { () in GameBoardCity(city: City.milan) }
    public let montreal = { () in GameBoardCity(city: City.montreal) }
    public let moscow = { () in GameBoardCity(city: City.moscow) }
    public let mumbai = { () in GameBoardCity(city: City.mumbai) }
    public let newyork = { () in GameBoardCity(city: City.newyork) }
    public let osaka = { () in GameBoardCity(city: City.osaka) }
    public let paris = { () in GameBoardCity(city: City.paris) }
    public let riyadh = { () in GameBoardCity(city: City.riyadh) }
    public let sanfrancisco = { () in GameBoardCity(city: City.sanfrancisco) }
    public let santiago = { () in GameBoardCity(city: City.santiago) }
    public let sãopaulo = { () in GameBoardCity(city: City.sãopaulo) }
    public let seoul = { () in GameBoardCity(city: City.seoul) }
    public let shanghai = { () in GameBoardCity(city: City.shanghai) }
    public let stpetersburg = { () in GameBoardCity(city: City.stpetersburg) }
    public let sydney = { () in GameBoardCity(city: City.sydney) }
    public let taipei = { () in GameBoardCity(city: City.taipei) }
    public let tehran = { () in GameBoardCity(city: City.tehran) }
    public let tokyo = { () in GameBoardCity(city: City.tokyo) }
    public let washington = { () in GameBoardCity(city: City.washington) }

}

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