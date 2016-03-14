//
//  City.swift
//  Pandemic
//
//  Created by Michael Welch on 3/13/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation

/**
Instances of conforming types have a name and color property which
 are used to distinguish each city.
*/
public protocol CityInfo {
    var name:String { get }
    var color:Color { get }
}

/**
 Represents a city in the game of Pandemic, and as such has a
 name, and a color
*/
public struct City : Equatable, Hashable {
    /// The name of the city
    public let name:String

    /// The color of the city
    public let color:Color

    public var hashValue:Int {
        return name.hashValue
    }

    init(name:String, color:Color) {
        self.name = name
        self.color = color
    }

    // All the player cards
    public static let algiers = City(name: "Algiers", color: .Black)
    public static let atlanta = City(name: "Atlanta", color: .Blue)
    public static let baghdad = City(name: "Baghdad", color: .Black)
    public static let bangkok = City(name: "Bangkok", color: .Red)
    public static let beijing = City(name: "Beijing", color: .Red)
    public static let bogotá = City(name: "Bogotá", color: .Yellow)
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
    public static let sãopaulo = City(name: "São Paulo", color: .Yellow)
    public static let seoul = City(name: "Seoul", color: .Red)
    public static let shanghai = City(name: "Shanghai", color: .Red)
    public static let stpetersburg = City(name: "St Petersburg", color: .Blue)
    public static let sydney = City(name: "Sydney", color: .Red)
    public static let taipei = City(name: "Taipei", color: .Red)
    public static let tehran = City(name: "Tehran", color: .Black)
    public static let tokyo = City(name: "Tokyo", color: .Red)
    public static let washington = City(name: "Washington", color: .Blue)

    public static var allCards:Set<City> = [algiers, atlanta, baghdad, bangkok, beijing, bogotá, buenosaires, cairo, chennai, chicago, delhi, essen, hochiminhcity, hongkong, istanbul, jakarta, johannesburg, karachi, khartoum, kinshasa, kolkata, lagos, lima, london, losangeles, madrid, manila, mexicocity, miami, milan, montreal, moscow, mumbai, newyork, osaka, paris, riyadh, sanfrancisco, santiago, sãopaulo, seoul, shanghai, stpetersburg, sydney, taipei, tehran, tokyo, washington]

    /**
     Finds all City values with names that contain the specified portion of a name.
     
     - returns: All cities whose names contain the string `portionOfName` anywhere
     in their name.

     - remark: It is sufficient to pass just the first 4 characters of any name
     to ensure uniquenss and to return only one City. For example the following
     will code will ensure `myCity` gets the value `City.sanfrancisco`.
     
     ````
     let myCity = City.findByName("san ").first!
     ````
    */
    public static func findByName(portionOfName:String) -> [City] {
        return allCards.findByName(portionOfName)
    }

}

extension City : CityInfo {

}

extension City : CustomStringConvertible {
    public var description:String {
        return self.name
    }
}

public func ==(lhs:City, rhs:City) -> Bool {
    return lhs.name == rhs.name
}