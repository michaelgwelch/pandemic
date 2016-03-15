//
//  PlayerCard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

private extension Array {
    mutating func swap(m:Int, _ n:Int) {
        let temp = self[Int(m)]
        self[Int(m)] = self[Int(n)]
        self[Int(n)] = temp
    }
}

private func random(upperBound:Int) -> Int {
    assert(upperBound < Int(UInt32.max), "random called with too large of an upper bound. limit it to UInt32.max")
    return Int(arc4random_uniform(UInt32(upperBound)))
}

private func shuffle<T>(cards:[T]) -> [T] {
    var shuffledDeck = cards
    let numberOfCards = cards.count
    for index in (1..<numberOfCards).reverse() {
        let n = random(index + 1)
        shuffledDeck.swap(index, n)
    }
    return shuffledDeck
}

public struct PlayerCardDeck {
    public let cards:[PlayerCard]

    private init(_ cards:[PlayerCard]) {
        self.cards = cards
    }

    public static func shuffledDeck() -> PlayerCardDeck {
        return PlayerCardDeck(shuffle(PlayerCard.allCards))
    }
}

public struct InfectionCardDeck {
    public let cards:[InfectionCard]

    private init(_ cards:[InfectionCard]) {
        self.cards = cards
    }

    public static func shuffledDeck() -> InfectionCardDeck {
        return InfectionCardDeck(shuffle(InfectionCard.allCards))
    }
}

/**
 Each value of PlayerCard represents one player card. Each card "depicts"
 one city.
*/
public struct PlayerCard : Equatable, Hashable {
    /// The city depicted on this card
    public let city:City

    public var hashValue:Int {
        return city.hashValue
    }

    private init(city:City) {
        self.city = city
    }

    // All the player cards
    public static let algiers = PlayerCard(city: City.algiers)
    public static let atlanta = PlayerCard(city: City.atlanta)
    public static let baghdad = PlayerCard(city: City.baghdad)
    public static let bangkok = PlayerCard(city: City.bangkok)
    public static let beijing = PlayerCard(city: City.beijing)
    public static let bogotá = PlayerCard(city: City.bogotá)
    public static let buenosaires = PlayerCard(city: City.buenosaires)
    public static let cairo = PlayerCard(city: City.cairo)
    public static let chennai = PlayerCard(city: City.chennai)
    public static let chicago = PlayerCard(city: City.chicago)
    public static let delhi = PlayerCard(city: City.delhi)
    public static let essen = PlayerCard(city: City.essen)
    public static let hochiminhcity = PlayerCard(city: City.hochiminhcity)
    public static let hongkong = PlayerCard(city: City.hongkong)
    public static let istanbul = PlayerCard(city: City.istanbul)
    public static let jakarta = PlayerCard(city: City.jakarta)
    public static let johannesburg = PlayerCard(city: City.johannesburg)
    public static let karachi = PlayerCard(city: City.karachi)
    public static let khartoum = PlayerCard(city: City.khartoum)
    public static let kinshasa = PlayerCard(city: City.kinshasa)
    public static let kolkata = PlayerCard(city: City.kolkata)
    public static let lagos = PlayerCard(city: City.lagos)
    public static let lima = PlayerCard(city: City.lima)
    public static let london = PlayerCard(city: City.london)
    public static let losangeles = PlayerCard(city: City.losangeles)
    public static let madrid = PlayerCard(city: City.madrid)
    public static let manila = PlayerCard(city: City.manila)
    public static let mexicocity = PlayerCard(city: City.mexicocity)
    public static let miami = PlayerCard(city: City.miami)
    public static let milan = PlayerCard(city: City.milan)
    public static let montreal = PlayerCard(city: City.montreal)
    public static let moscow = PlayerCard(city: City.moscow)
    public static let mumbai = PlayerCard(city: City.mumbai)
    public static let newyork = PlayerCard(city: City.newyork)
    public static let osaka = PlayerCard(city: City.osaka)
    public static let paris = PlayerCard(city: City.paris)
    public static let riyadh = PlayerCard(city: City.riyadh)
    public static let sanfrancisco = PlayerCard(city: City.sanfrancisco)
    public static let santiago = PlayerCard(city: City.santiago)
    public static let sãopaulo = PlayerCard(city: City.sãopaulo)
    public static let seoul = PlayerCard(city: City.seoul)
    public static let shanghai = PlayerCard(city: City.shanghai)
    public static let stpetersburg = PlayerCard(city: City.stpetersburg)
    public static let sydney = PlayerCard(city: City.sydney)
    public static let taipei = PlayerCard(city: City.taipei)
    public static let tehran = PlayerCard(city: City.tehran)
    public static let tokyo = PlayerCard(city: City.tokyo)
    public static let washington = PlayerCard(city: City.washington)

    public static let allCards:[PlayerCard] = [algiers, atlanta, baghdad, bangkok, beijing, bogotá, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, sãopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    /**
     Finds all PlayerCard values with names that contain the specified portion of a name.

     - returns: All PlayerCards whose names contain the string `portionOfName` anywhere
     in their name.

     - remark: It is sufficient to pass just the first 4 characters of any name
     to ensure uniquenss and to return only one PlayerCard. For example the following
     code will ensure `myCard` gets the value `City.santiago`.

     ````
     let myCard = PlayerCard.findByName("sant").first!
     ````
     */
    public static func findByName(name:String) -> [PlayerCard] {
        return allCards.findByName(name)
    }

}

extension PlayerCard : CityInfo {
    public var name:String {
        return city.name
    }
    public var color:Color {
        return city.color
    }
}

extension PlayerCard : CustomStringConvertible {
    public var description:String {
        return self.city.name
    }
}


/**
 Each value of InfectionCard represents one infection card from the Pandemic
 infection deck
*/
public struct InfectionCard : Equatable, Hashable {
    public let city:City

    public var hashValue:Int {
        return city.hashValue
    }

    private init(city:City) {
        self.city = city
    }

    // All the infection cards
    public static let algiers = InfectionCard(city: City.algiers)
    public static let atlanta = InfectionCard(city: City.atlanta)
    public static let baghdad = InfectionCard(city: City.baghdad)
    public static let bangkok = InfectionCard(city: City.bangkok)
    public static let beijing = InfectionCard(city: City.beijing)
    public static let bogotá = InfectionCard(city: City.bogotá)
    public static let buenosaires = InfectionCard(city: City.buenosaires)
    public static let cairo = InfectionCard(city: City.cairo)
    public static let chennai = InfectionCard(city: City.chennai)
    public static let chicago = InfectionCard(city: City.chicago)
    public static let delhi = InfectionCard(city: City.delhi)
    public static let essen = InfectionCard(city: City.essen)
    public static let hochiminhcity = InfectionCard(city: City.hochiminhcity)
    public static let hongkong = InfectionCard(city: City.hongkong)
    public static let istanbul = InfectionCard(city: City.istanbul)
    public static let jakarta = InfectionCard(city: City.jakarta)
    public static let johannesburg = InfectionCard(city: City.johannesburg)
    public static let karachi = InfectionCard(city: City.karachi)
    public static let khartoum = InfectionCard(city: City.khartoum)
    public static let kinshasa = InfectionCard(city: City.kinshasa)
    public static let kolkata = InfectionCard(city: City.kolkata)
    public static let lagos = InfectionCard(city: City.lagos)
    public static let lima = InfectionCard(city: City.lima)
    public static let london = InfectionCard(city: City.london)
    public static let losangeles = InfectionCard(city: City.losangeles)
    public static let madrid = InfectionCard(city: City.madrid)
    public static let manila = InfectionCard(city: City.manila)
    public static let mexicocity = InfectionCard(city: City.mexicocity)
    public static let miami = InfectionCard(city: City.miami)
    public static let milan = InfectionCard(city: City.milan)
    public static let montreal = InfectionCard(city: City.montreal)
    public static let moscow = InfectionCard(city: City.moscow)
    public static let mumbai = InfectionCard(city: City.mumbai)
    public static let newyork = InfectionCard(city: City.newyork)
    public static let osaka = InfectionCard(city: City.osaka)
    public static let paris = InfectionCard(city: City.paris)
    public static let riyadh = InfectionCard(city: City.riyadh)
    public static let sanfrancisco = InfectionCard(city: City.sanfrancisco)
    public static let santiago = InfectionCard(city: City.santiago)
    public static let sãopaulo = InfectionCard(city: City.sãopaulo)
    public static let seoul = InfectionCard(city: City.seoul)
    public static let shanghai = InfectionCard(city: City.shanghai)
    public static let stpetersburg = InfectionCard(city: City.stpetersburg)
    public static let sydney = InfectionCard(city: City.sydney)
    public static let taipei = InfectionCard(city: City.taipei)
    public static let tehran = InfectionCard(city: City.tehran)
    public static let tokyo = InfectionCard(city: City.tokyo)
    public static let washington = InfectionCard(city: City.washington)

    public static let allCards:[InfectionCard] = [algiers, atlanta, baghdad, bangkok, beijing, bogotá, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, sãopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    public static func findByName(name:String) -> [InfectionCard] {
        return allCards.findByName(name)
    }

}

extension InfectionCard : CityInfo {
    public var name:String {
        return city.name
    }
    public var color:Color {
        return city.color
    }
}

extension InfectionCard : CustomStringConvertible {
    public var description:String {
        return self.city.name
    }
}


extension SequenceType  where Generator.Element : CityInfo {
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
    return lhs.city == rhs.city
}

public func ==(lhs:PlayerCard, rhs:PlayerCard) -> Bool {
    return lhs.city == rhs.city
}