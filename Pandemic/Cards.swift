//
//  Cards.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

private func random(upperBound:Int) -> Int {
    assert(upperBound < Int(UInt32.max), "random called with too large of an upper bound. limit it to UInt32.max")
    return Int(arc4random_uniform(UInt32(upperBound)))
}

public func shuffle<T>(cards:[T]) -> [T] {
    guard cards.count > 0 else {
        return cards
    }
    var shuffledDeck = cards
    let numberOfCards = cards.count
    for index in (1..<numberOfCards).reverse() {
        let n = random(index + 1)
        if (index != n) {
            swap(&shuffledDeck[index], &shuffledDeck[n])
        }
    }
    return shuffledDeck
}

public struct PlayerCardDeck {
    private var remainingCards:[PlayerCard]
    public var discardPile:[PlayerCard]
    public var cardsInUse:[PlayerCard]

    public func searchDiscardPileForCityWithName(name:String) -> [CityCard] {
        let sequence = (discardPile.filter { $0.isCityCard }).map { (card:PlayerCard) -> CityCard in
            if case .City(let cityCard) = card {
                return cityCard
            } else {
                assert(true, "Entered a can't happen condition")
                return CityCard.algiers
            }
        }
        return sequence.findCityByName(name)
    }

    /**
     Prepares a deck to deal from with no event cards.
    */
    public init() {
        self.init(withEventCards: [])
    }
    /**
     Prepares a deck to deal from. Includes the specified event cards
    */
    public init(withEventCards eventCards:[EventCard]) {
        var cards = CityCard.allCards.map { PlayerCard.City($0) }
        cards.appendContentsOf( eventCards.map { PlayerCard.Event($0) })
        shuffle(cards)

        remainingCards = cards
        discardPile = []
        cardsInUse = []
    }

    mutating private func deal(numberOfPlayers:Int) throws -> [[PlayerCard]] {
        guard numberOfPlayers > 1 && numberOfPlayers < 5 else {
            throw ArgumentError.OutOfRange("numberOfPlayers")
        }

        var hands:[[PlayerCard]] = [[PlayerCard]]()
        let handSize:Int
        if numberOfPlayers == 2 {
            handSize = 4
        } else if numberOfPlayers == 3 {
            handSize = 3
        } else if numberOfPlayers == 4 {
            handSize = 4
        } else {
            // can't happen
            handSize = 0
        }

        for _ in 0..<numberOfPlayers {
            hands.append(remainingCards.popFirst(handSize))
        }

        return hands

    }
}

extension Array {
    public mutating func popFirst(n:Int) -> [Element] {
        let result = self.prefix(n)
        self.removeFirst(n)
        return Array<Element>(result)
    }
}



public struct InfectionCardDeck {
    private(set) public var remainingCards:[InfectionCard]
    private(set) public var discardPile:[InfectionCard] = []

    private init(_ cards:[InfectionCard]) {
        self.remainingCards = cards
    }

    mutating func draw(city:CityInfo) {
        var cards = remainingCards.findCityByName(city.name)
        if (cards.count == 1) {
            discardPile.append(cards[0])
            let index = remainingCards.indexOf(cards[0])!
            remainingCards.removeAtIndex(index)
        }
    }

    public static func shuffledDeck() -> InfectionCardDeck {
        return InfectionCardDeck(shuffle(InfectionCard.allCards))
    }
}

public enum PlayerCard : Equatable {
    case Epidemic
    case Event(EventCard)
    case City(CityCard)
}

extension PlayerCard {
    public var isCityCard:Bool {
        if case City(_) = self {
            return true
        }
        return false
    }

    public var isEventCard:Bool {
        if case Event(_) = self {
            return true
        } else {
            return false
        }
    }

    public var cityCard:CityCard? {
        if case .City(let cityCard) = self {
            return cityCard
        } else {
            return nil
        }
    }

    public var eventCard:EventCard? {
        if case .Event(let eventCard) = self {
            return eventCard
        } else {
            return nil
        }
    }

    public var isEpidemic:Bool {
        if case .Epidemic = self {
            return true
        } else {
            return false
        }
    }
}

extension PlayerCard : CustomStringConvertible {
    public var description:String {
        switch self {
        case .Epidemic:
            return "Epidemic"
        case .Event(let eventCard):
            return eventCard.rawValue
        case .City(let cityCard):
            return cityCard.description
        }
    }
}

public func ==(lhs:PlayerCard, rhs:PlayerCard) -> Bool {
    switch lhs {
    case .Epidemic:
        return rhs.isEpidemic
    case .City(let cityCard):
        return cityCard == rhs.cityCard
    case .Event(let eventCard):
        return eventCard == rhs.eventCard
    }

}


public enum EventCard : String {
    case LocalInitiative
    case BorrowedTime
    case RemoteOutpost
    case FlexibleAidPackage
    case Airlift
    case OneQuietNight
    case Forecase
    case GovernmentGrant
    case ResilientPopulations
    case RemoteTreatment
    case NewAssignment
}

/**
 Each value of CityCard represents one player card. Each card "depicts"
 one city.
*/
public struct CityCard : Equatable, Hashable {
    /// The city depicted on this card
    public let city:City

    public var hashValue:Int {
        return city.hashValue
    }

    private init(city:City) {
        self.city = city
    }

    // All the player cards
    public static let algiers = CityCard(city: City.algiers)
    public static let atlanta = CityCard(city: City.atlanta)
    public static let baghdad = CityCard(city: City.baghdad)
    public static let bangkok = CityCard(city: City.bangkok)
    public static let beijing = CityCard(city: City.beijing)
    public static let bogotá = CityCard(city: City.bogotá)
    public static let buenosaires = CityCard(city: City.buenosaires)
    public static let cairo = CityCard(city: City.cairo)
    public static let chennai = CityCard(city: City.chennai)
    public static let chicago = CityCard(city: City.chicago)
    public static let delhi = CityCard(city: City.delhi)
    public static let essen = CityCard(city: City.essen)
    public static let hochiminhcity = CityCard(city: City.hochiminhcity)
    public static let hongkong = CityCard(city: City.hongkong)
    public static let istanbul = CityCard(city: City.istanbul)
    public static let jakarta = CityCard(city: City.jakarta)
    public static let johannesburg = CityCard(city: City.johannesburg)
    public static let karachi = CityCard(city: City.karachi)
    public static let khartoum = CityCard(city: City.khartoum)
    public static let kinshasa = CityCard(city: City.kinshasa)
    public static let kolkata = CityCard(city: City.kolkata)
    public static let lagos = CityCard(city: City.lagos)
    public static let lima = CityCard(city: City.lima)
    public static let london = CityCard(city: City.london)
    public static let losangeles = CityCard(city: City.losangeles)
    public static let madrid = CityCard(city: City.madrid)
    public static let manila = CityCard(city: City.manila)
    public static let mexicocity = CityCard(city: City.mexicocity)
    public static let miami = CityCard(city: City.miami)
    public static let milan = CityCard(city: City.milan)
    public static let montreal = CityCard(city: City.montreal)
    public static let moscow = CityCard(city: City.moscow)
    public static let mumbai = CityCard(city: City.mumbai)
    public static let newyork = CityCard(city: City.newyork)
    public static let osaka = CityCard(city: City.osaka)
    public static let paris = CityCard(city: City.paris)
    public static let riyadh = CityCard(city: City.riyadh)
    public static let sanfrancisco = CityCard(city: City.sanfrancisco)
    public static let santiago = CityCard(city: City.santiago)
    public static let sãopaulo = CityCard(city: City.sãopaulo)
    public static let seoul = CityCard(city: City.seoul)
    public static let shanghai = CityCard(city: City.shanghai)
    public static let stpetersburg = CityCard(city: City.stpetersburg)
    public static let sydney = CityCard(city: City.sydney)
    public static let taipei = CityCard(city: City.taipei)
    public static let tehran = CityCard(city: City.tehran)
    public static let tokyo = CityCard(city: City.tokyo)
    public static let washington = CityCard(city: City.washington)

    public static let allCards:[CityCard] = [algiers, atlanta, baghdad, bangkok, beijing, bogotá, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, sãopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    /**
     Finds all CityCard values with names that contain the specified portion of a name.

     - returns: All CityCards whose names contain the string `portionOfName` anywhere
     in their name.

     - remark: It is sufficient to pass just the first 4 characters of any name
     to ensure uniquenss and to return only one CityCard. For example the following
     code will ensure `myCard` gets the value `City.santiago`.

     ````
     let myCard = CityCard.findByName("sant").first!
     ````
     */
    public static func findByName(name:String) -> [CityCard] {
        return allCards.findCityByName(name)
    }

}


extension CityCard : CityInfo {
    public var name:String {
        return city.name
    }
    public var color:Color {
        return city.color
    }
}

extension CityCard : CustomStringConvertible {
    
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
        return allCards.findCityByName(name)
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

}

extension CityInfo {
    public var description:String {
        return "\(self.name), \(color)"
    }
}


extension SequenceType  where Generator.Element : CityInfo {
    public func findCityByName(name:String) -> [Generator.Element] {
        

        var candidates = self.filter {
            let result = $0.name.lowercaseString.rangeOfString(name.lowercaseString)
            return result != nil
        }

        if (name.lowercaseString.containsString("sao")) {
            candidates.appendContentsOf(self.findCityByName("são"))
        }

        if (name.lowercaseString.containsString("ota")) {
            candidates.appendContentsOf(self.findCityByName("otá"))
        }

        return candidates
    }
}


public func ==(lhs:InfectionCard, rhs:InfectionCard) -> Bool {
    return lhs.city == rhs.city
}

public func ==(lhs:CityCard, rhs:CityCard) -> Bool {
    return lhs.city == rhs.city
}