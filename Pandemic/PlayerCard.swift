//
//  PlayerCard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

public struct PlayerCard {
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
    public static let bogota = PlayerCard(name: "Bogotá", color: .Yellow)
    public static let buenosaires = PlayerCard(name: "Buenos Aires", color: .Yellow)
    public static let cairo = PlayerCard(name: "Cairo", color: .Black)
    public static let chennai = PlayerCard(name: "Chennai", color: .Black)
    public static let chicago = PlayerCard(name: "Chicago", color: .Blue)
    public static let delhi = PlayerCard(name: "Delhi", color: .Black)
    public static let essen = PlayerCard(name: "Essen", color: .Blue)
    public static let hochiminhcity = PlayerCard(name: "Ho Chi Minh PlayerCard", color: .Red)
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
    public static let mexicocity = PlayerCard(name: "Mexico PlayerCard", color: .Yellow)
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
    public static let saopaulo = PlayerCard(name: "São Paulo", color: .Yellow)
    public static let seoul = PlayerCard(name: "Seoul", color: .Red)
    public static let shanghai = PlayerCard(name: "Shanghai", color: .Red)
    public static let stpetersburg = PlayerCard(name: "St Petersburg", color: .Blue)
    public static let sydney = PlayerCard(name: "Sydney", color: .Red)
    public static let taipei = PlayerCard(name: "Taipei", color: .Red)
    public static let tehran = PlayerCard(name: "Tehran", color: .Black)
    public static let tokyo = PlayerCard(name: "Tokyo", color: .Red)
    public static let washington = PlayerCard(name: "Washington", color: .Blue)

    private var allCards = [PlayerCard.algiers, PlayerCard.atlanta, PlayerCard.baghdad, PlayerCard.bangkok, PlayerCard.beijing, PlayerCard.bogota, PlayerCard.buenosaires, PlayerCard.cairo, PlayerCard.chennai, PlayerCard.chicago, PlayerCard.delhi, PlayerCard.essen, PlayerCard.hochiminhcity, PlayerCard.hongkong, PlayerCard.istanbul, PlayerCard.jakarta, PlayerCard.johannesburg, PlayerCard.karachi, PlayerCard.khartoum, PlayerCard.kinshasa, PlayerCard.kolkata, PlayerCard.lagos, PlayerCard.lima, PlayerCard.london, PlayerCard.losangeles, PlayerCard.madrid, PlayerCard.manila, PlayerCard.mexicocity, PlayerCard.miami, PlayerCard.milan, PlayerCard.montreal, PlayerCard.moscow, PlayerCard.mumbai, PlayerCard.newyork, PlayerCard.osaka, PlayerCard.paris, PlayerCard.riyadh, PlayerCard.sanfrancisco, PlayerCard.santiago, PlayerCard.saopaulo, PlayerCard.seoul, PlayerCard.shanghai, PlayerCard.stpetersburg, PlayerCard.sydney, PlayerCard.taipei, PlayerCard.tehran, PlayerCard.tokyo, PlayerCard.washington]


}

public class PlayerCardDeck {

}




//public func ==(lhs:PlayerCard, rhs:PlayerCard) -> Bool {
//    return lhs.name == rhs.name
//}