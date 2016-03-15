//
//  GameBoard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation
public enum OpenOrBlocked {
    case Open
    case Blocked
}


extension OpenOrBlocked : Comparable {

}

extension OpenOrBlocked : Summable {

}

public func +(lhs:OpenOrBlocked, rhs:OpenOrBlocked) -> OpenOrBlocked {
    if lhs == .Blocked || rhs == .Blocked {
        return .Blocked
    }
    return .Open
}
public func <(lhs:OpenOrBlocked, rhs:OpenOrBlocked) -> Bool {
    if lhs == .Open {
        return rhs == .Blocked
    }

    return false
}





/**
 Represents everything visible on the Pandemic Board
*/
public class GameBoard {


    private(set) public var positions:[Pandemic.Character:Int]

    private let graph:WeightedGraph<GameBoardCity,OpenOrBlocked>
    private let allCities:[GameBoardCity]

    convenience init() {
        self.init(withCharacters: [], inCity:City.atlanta)
    }

    init(withCharacters characters:[Pandemic.Character], inCity city:City) {

        graph = GameBoard.createPandemicMap()
        allCities = graph.vertices.map { $0 as GameBoardCity }
        let indexOfCity = graph.indexOf { $0.name == city.name }!

        positions = [Character:Int](tuples: characters.map { ($0, indexOfCity) })

    }

    func positionOfCharacter(character:Character) -> GameBoardCity {
        return graph[positions[character]!]
    }

    func driveOrFerryCharacter(character:Character, toCity city:GameBoardCity) throws {
        let currentCity = positionOfCharacter(character)
        let routesOut = graph.edgesForVertex(currentCity) ?? []
        let route = routesOut.filter { edge in
            let edgeDestinationCity = graph.vertexAtIndex(edge.v)
            return edgeDestinationCity.name == city.name
            }.first

        guard route != nil else {
            throw GameError.DriveOrFerryCityUnreachable(to: city.name, from: currentCity.name)
        }

        positions[character] = route!.v
    }

    public var textualGraph:String {
        return graph.description
    }

    private static func createPandemicMap() -> WeightedGraph<GameBoardCity,OpenOrBlocked> {

        let graph = WeightedGraph<GameBoardCity,OpenOrBlocked>()

        let factory = GameBoardCityFactory()

        let algiersIndex = graph.addVertex(factory.algiers())
        let atlantaIndex = graph.addVertex(factory.atlanta())
        let baghdadIndex = graph.addVertex(factory.baghdad())
        let bangkokIndex = graph.addVertex(factory.bangkok())
        let beijingIndex = graph.addVertex(factory.beijing())
        let bogotaIndex = graph.addVertex(factory.bogotá())
        let buenosairesIndex = graph.addVertex(factory.buenosaires())
        let cairoIndex = graph.addVertex(factory.cairo())
        let chennaiIndex = graph.addVertex(factory.chennai())
        let chicagoIndex = graph.addVertex(factory.chicago())
        let delhiIndex = graph.addVertex(factory.delhi())
        let essenIndex = graph.addVertex(factory.essen())
        let hochiminhcityIndex = graph.addVertex(factory.hochiminhcity())
        let hongkongIndex = graph.addVertex(factory.hongkong())
        let istanbulIndex = graph.addVertex(factory.istanbul())
        let jakartaIndex = graph.addVertex(factory.jakarta())
        let johannesburgIndex = graph.addVertex(factory.johannesburg())
        let karachiIndex = graph.addVertex(factory.karachi())
        let khartoumIndex = graph.addVertex(factory.khartoum())
        let kinshasaIndex = graph.addVertex(factory.kinshasa())
        let kolkataIndex = graph.addVertex(factory.kolkata())
        let lagosIndex = graph.addVertex(factory.lagos())
        let limaIndex = graph.addVertex(factory.lima())
        let londonIndex = graph.addVertex(factory.london())
        let losangelesIndex = graph.addVertex(factory.losangeles())
        let madridIndex = graph.addVertex(factory.madrid())
        let manilaIndex = graph.addVertex(factory.manila())
        let mexicocityIndex = graph.addVertex(factory.mexicocity())
        let miamiIndex = graph.addVertex(factory.miami())
        let milanIndex = graph.addVertex(factory.milan())
        let montrealIndex = graph.addVertex(factory.montreal())
        let moscowIndex = graph.addVertex(factory.moscow())
        let mumbaiIndex = graph.addVertex(factory.mumbai())
        let newyorkIndex = graph.addVertex(factory.newyork())
        let osakaIndex = graph.addVertex(factory.osaka())
        let parisIndex = graph.addVertex(factory.paris())
        let riyadhIndex = graph.addVertex(factory.riyadh())
        let sanfranciscoIndex = graph.addVertex(factory.sanfrancisco())
        let santiagoIndex = graph.addVertex(factory.santiago())
        let saopauloIndex = graph.addVertex(factory.sãopaulo())
        let seoulIndex = graph.addVertex(factory.seoul())
        let shanghaiIndex = graph.addVertex(factory.shanghai())
        let stpetersburgIndex = graph.addVertex(factory.stpetersburg())
        let sydneyIndex = graph.addVertex(factory.sydney())
        let taipeiIndex = graph.addVertex(factory.taipei())
        let tehranIndex = graph.addVertex(factory.tehran())
        let tokyoIndex = graph.addVertex(factory.tokyo())
        let washingtonIndex = graph.addVertex(factory.washington())

        func addEdges(from: Int, to:[Int]) {
            to.forEach { graph.addEdge(from, to: $0, weight: .Open) }
        }

        addEdges(algiersIndex, to:[cairoIndex, istanbulIndex, madridIndex, parisIndex])
        addEdges(atlantaIndex, to:[chicagoIndex, miamiIndex, washingtonIndex])
        addEdges(baghdadIndex, to:[cairoIndex, istanbulIndex, riyadhIndex, tehranIndex])
        addEdges(bangkokIndex, to:[hochiminhcityIndex, hongkongIndex, jakartaIndex, kolkataIndex])
        addEdges(beijingIndex, to:[seoulIndex, shanghaiIndex])
        addEdges(bogotaIndex, to:[buenosairesIndex, limaIndex, mexicocityIndex, miamiIndex, saopauloIndex])
        addEdges(buenosairesIndex, to:[johannesburgIndex, santiagoIndex, saopauloIndex])
        addEdges(cairoIndex, to:[istanbulIndex, khartoumIndex, riyadhIndex])
        addEdges(chennaiIndex, to:[delhiIndex, jakartaIndex, kolkataIndex, mumbaiIndex])
        addEdges(chicagoIndex, to:[losangelesIndex, mexicocityIndex, montrealIndex, sanfranciscoIndex])
        addEdges(delhiIndex, to:[karachiIndex, kolkataIndex, mumbaiIndex, tehranIndex])
        addEdges(essenIndex, to:[londonIndex, milanIndex, parisIndex, stpetersburgIndex])
        addEdges(hochiminhcityIndex, to:[hongkongIndex, jakartaIndex, manilaIndex])
        addEdges(hongkongIndex, to:[kolkataIndex, manilaIndex, shanghaiIndex, taipeiIndex])
        addEdges(istanbulIndex, to:[milanIndex, moscowIndex, stpetersburgIndex])
        addEdges(jakartaIndex, to:[sydneyIndex])
        addEdges(johannesburgIndex, to:[khartoumIndex, kinshasaIndex])
        addEdges(karachiIndex, to:[mumbaiIndex, riyadhIndex, tehranIndex])
        addEdges(khartoumIndex, to:[kinshasaIndex, lagosIndex])
        addEdges(kinshasaIndex, to:[lagosIndex])
        addEdges(lagosIndex, to:[saopauloIndex])
        addEdges(limaIndex, to:[losangelesIndex, mexicocityIndex, santiagoIndex])
        addEdges(londonIndex, to:[madridIndex, newyorkIndex, parisIndex])
        addEdges(losangelesIndex, to:[mexicocityIndex, sanfranciscoIndex, sydneyIndex])
        addEdges(madridIndex, to:[newyorkIndex, parisIndex, saopauloIndex])
        addEdges(manilaIndex, to:[sanfranciscoIndex, sydneyIndex, taipeiIndex])
        addEdges(mexicocityIndex, to:[miamiIndex])
        addEdges(miamiIndex, to:[washingtonIndex])
        addEdges(milanIndex, to:[parisIndex])
        addEdges(montrealIndex, to:[newyorkIndex, washingtonIndex])
        addEdges(moscowIndex, to:[stpetersburgIndex, tehranIndex])
        addEdges(newyorkIndex, to:[washingtonIndex])
        addEdges(osakaIndex, to:[taipeiIndex, tokyoIndex])
        addEdges(sanfranciscoIndex, to:[tokyoIndex])
        addEdges(seoulIndex, to:[shanghaiIndex, tokyoIndex])
        addEdges(shanghaiIndex, to:[taipeiIndex, tokyoIndex])

        return graph
    }


    public func findCityByName(name:String) -> [GameBoardCity] {
        return allCities.findByName(name)
    }
}



extension Dictionary {
    init(tuples:[(Key, Value)]) {
        var dictionary = [Key:Value]()
        tuples.forEach { (key, value) in dictionary[key] = value }
        self = dictionary
    }
}



extension SequenceType {
    func first(includeElement: (Self.Generator.Element) -> Bool) -> Self.Generator.Element {
        return self.filter(includeElement).first!
    }
}