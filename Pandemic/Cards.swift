//
//  PlayerCard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public protocol CityRepresentation {
    var name:String { get }
    var color:Color { get }
}

public struct PlayerCard : Equatable {
    public let name:String
    public let color:Color

    init(name:String, color:Color) {
        self.name = name
        self.color = color
    }

    // All the player cards
    public static let algiers = PlayerCard(name: "Algiers", color: .Black)
    public static let atlanta = PlayerCard(name: "Atlanta", color: .Blue)
    public static let baghdad = PlayerCard(name: "Baghdad", color: .Black)
    public static let bangkok = PlayerCard(name: "Bangkok", color: .Red)
    public static let beijing = PlayerCard(name: "Beijing", color: .Red)

    /**
     An alias for PlayerCard.bogotá for convenience. It returns the exact same
     instance of PlayerCard
    */
    public static let bogota = PlayerCard(name: "Bogotá", color: .Yellow)
    public static let bogotá = bogota
    public static let buenosaires = PlayerCard(name: "Buenos Aires", color: .Yellow)
    public static let cairo = PlayerCard(name: "Cairo", color: .Black)
    public static let chennai = PlayerCard(name: "Chennai", color: .Black)
    public static let chicago = PlayerCard(name: "Chicago", color: .Blue)
    public static let delhi = PlayerCard(name: "Delhi", color: .Black)
    public static let essen = PlayerCard(name: "Essen", color: .Blue)
    public static let hochiminhcity = PlayerCard(name: "Ho Chi Minh City", color: .Red)
    public static let hongkong = PlayerCard(name: "Hong Kong", color: .Red)
    public static let istanbul = PlayerCard(name: "Istanbul", color: .Black)
    public static let jakarta = PlayerCard(name: "Jakarta", color: .Red)
    public static let johannesburg = PlayerCard(name: "Johannesburg", color: .Yellow)
    public static let karachi = PlayerCard(name: "Karachi", color: .Black)
    public static let khartoum = PlayerCard(name: "Khartoum", color: .Yellow)
    public static let kinshasa = PlayerCard(name: "Kinshasa", color: .Yellow)
    public static let kolkata = PlayerCard(name: "Kolkata", color: .Black)
    public static let lagos = PlayerCard(name: "Lagos", color: .Yellow)
    public static let lima = PlayerCard(name: "Lima", color: .Yellow)
    public static let london = PlayerCard(name: "London", color: .Blue)
    public static let losangeles = PlayerCard(name: "Los Angeles", color: .Yellow)
    public static let madrid = PlayerCard(name: "Madrid", color: .Blue)
    public static let manila = PlayerCard(name: "Manila", color: .Red)
    public static let mexicocity = PlayerCard(name: "Mexico City", color: .Yellow)
    public static let miami = PlayerCard(name: "Miami", color: .Yellow)
    public static let milan = PlayerCard(name: "Milan", color: .Blue)
    public static let montreal = PlayerCard(name: "Montreal", color: .Blue)
    public static let moscow = PlayerCard(name: "Moscow", color: .Black)
    public static let mumbai = PlayerCard(name: "Mumbai", color: .Black)
    public static let newyork = PlayerCard(name: "New York", color: .Blue)
    public static let osaka = PlayerCard(name: "Osaka", color: .Red)
    public static let paris = PlayerCard(name: "Paris", color: .Blue)
    public static let riyadh = PlayerCard(name: "Riyadh", color: .Black)
    public static let sanfrancisco = PlayerCard(name: "San Francisco", color: .Blue)
    public static let santiago = PlayerCard(name: "Santiago", color: .Yellow)

    /**
     An alias for PlayerCard.sãopaulo for convenience.
    */
    public static let saopaulo = PlayerCard(name: "São Paulo", color: .Yellow)
    public static let sãopaulo = saopaulo
    public static let seoul = PlayerCard(name: "Seoul", color: .Red)
    public static let shanghai = PlayerCard(name: "Shanghai", color: .Red)
    public static let stpetersburg = PlayerCard(name: "St Petersburg", color: .Blue)
    public static let sydney = PlayerCard(name: "Sydney", color: .Red)
    public static let taipei = PlayerCard(name: "Taipei", color: .Red)
    public static let tehran = PlayerCard(name: "Tehran", color: .Black)
    public static let tokyo = PlayerCard(name: "Tokyo", color: .Red)
    public static let washington = PlayerCard(name: "Washington", color: .Blue)

    public static var allCards = [algiers, atlanta, baghdad, bangkok, beijing, bogota, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, saopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [PlayerCard] {
        return allCards.findByName(name)
    }

}

extension PlayerCard : CityRepresentation {

}

public struct InfectionCard {
    public let name:String
    public let color:Color

    init(name:String, color:Color) {
        self.name = name
        self.color = color
    }

    // All the player cards
    public static let algiers = InfectionCard(name: "Algiers", color: .Black)
    public static let atlanta = InfectionCard(name: "Atlanta", color: .Blue)
    public static let baghdad = InfectionCard(name: "Baghdad", color: .Black)
    public static let bangkok = InfectionCard(name: "Bangkok", color: .Red)
    public static let beijing = InfectionCard(name: "Beijing", color: .Red)

    /**
     An alias for InfectionCard.bogotá for convenience. It returns the exact same
     instance of InfectionCard
     */
    public static let bogota = InfectionCard(name: "Bogotá", color: .Yellow)
    public static let bogotá = bogota
    public static let buenosaires = InfectionCard(name: "Buenos Aires", color: .Yellow)
    public static let cairo = InfectionCard(name: "Cairo", color: .Black)
    public static let chennai = InfectionCard(name: "Chennai", color: .Black)
    public static let chicago = InfectionCard(name: "Chicago", color: .Blue)
    public static let delhi = InfectionCard(name: "Delhi", color: .Black)
    public static let essen = InfectionCard(name: "Essen", color: .Blue)
    public static let hochiminhcity = InfectionCard(name: "Ho Chi Minh City", color: .Red)
    public static let hongkong = InfectionCard(name: "Hong Kong", color: .Red)
    public static let istanbul = InfectionCard(name: "Istanbul", color: .Black)
    public static let jakarta = InfectionCard(name: "Jakarta", color: .Red)
    public static let johannesburg = InfectionCard(name: "Johannesburg", color: .Yellow)
    public static let karachi = InfectionCard(name: "Karachi", color: .Black)
    public static let khartoum = InfectionCard(name: "Khartoum", color: .Yellow)
    public static let kinshasa = InfectionCard(name: "Kinshasa", color: .Yellow)
    public static let kolkata = InfectionCard(name: "Kolkata", color: .Black)
    public static let lagos = InfectionCard(name: "Lagos", color: .Yellow)
    public static let lima = InfectionCard(name: "Lima", color: .Yellow)
    public static let london = InfectionCard(name: "London", color: .Blue)
    public static let losangeles = InfectionCard(name: "Los Angeles", color: .Yellow)
    public static let madrid = InfectionCard(name: "Madrid", color: .Blue)
    public static let manila = InfectionCard(name: "Manila", color: .Red)
    public static let mexicocity = InfectionCard(name: "Mexico City", color: .Yellow)
    public static let miami = InfectionCard(name: "Miami", color: .Yellow)
    public static let milan = InfectionCard(name: "Milan", color: .Blue)
    public static let montreal = InfectionCard(name: "Montreal", color: .Blue)
    public static let moscow = InfectionCard(name: "Moscow", color: .Black)
    public static let mumbai = InfectionCard(name: "Mumbai", color: .Black)
    public static let newyork = InfectionCard(name: "New York", color: .Blue)
    public static let osaka = InfectionCard(name: "Osaka", color: .Red)
    public static let paris = InfectionCard(name: "Paris", color: .Blue)
    public static let riyadh = InfectionCard(name: "Riyadh", color: .Black)
    public static let sanfrancisco = InfectionCard(name: "San Francisco", color: .Blue)
    public static let santiago = InfectionCard(name: "Santiago", color: .Yellow)

    /**
     An alias for InfectionCard.sãopaulo for convenience.
     */
    public static let saopaulo = InfectionCard(name: "São Paulo", color: .Yellow)
    public static let sãopaulo = saopaulo
    public static let seoul = InfectionCard(name: "Seoul", color: .Red)
    public static let shanghai = InfectionCard(name: "Shanghai", color: .Red)
    public static let stpetersburg = InfectionCard(name: "St Petersburg", color: .Blue)
    public static let sydney = InfectionCard(name: "Sydney", color: .Red)
    public static let taipei = InfectionCard(name: "Taipei", color: .Red)
    public static let tehran = InfectionCard(name: "Tehran", color: .Black)
    public static let tokyo = InfectionCard(name: "Tokyo", color: .Red)
    public static let washington = InfectionCard(name: "Washington", color: .Blue)

    public static var allCards = [algiers, atlanta, baghdad, bangkok, beijing, bogota, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, saopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [InfectionCard] {
        return allCards.findByName(name)
    }

}

extension InfectionCard : Equatable {

}

extension InfectionCard : CityRepresentation {

}

extension SequenceType  where Generator.Element : CityRepresentation {
    public func findByName(name:String) -> [Generator.Element] {
        

        var candidates = self.filter {
            let result = $0.name.lowercaseString.rangeOfString(name.lowercaseString)
            return result != nil
        }

        if (name.lowercaseString.containsString("sao")) {
            candidates.appendContentsOf(self.findByName("são"))
        }

        if (name.lowercaseString.containsString("ota")) {
            candidates.appendContentsOf(self.findByName("otá"))
        }

        return candidates
    }
}


public func ==(lhs:InfectionCard, rhs:InfectionCard) -> Bool {
    return lhs.name == rhs.name
}

public func ==(lhs:PlayerCard, rhs:PlayerCard) -> Bool {
    return lhs.name == rhs.name
}