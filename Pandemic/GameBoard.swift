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

    convenience init() {
        self.init(withCharacters: [], inCity:GameBoardCity.atlanta)
    }

    init(withCharacters characters:[Pandemic.Character], inCity city:GameBoardCity) {

        graph = GameBoard.createPandemicMap()
        let indexOfCity = graph.indexOfVertex(city)!

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
            return edgeDestinationCity.city == city.city
            }.first

        guard route != nil else {
            throw ExecutionError.DriveOrFerryCityUnreachable(to: city.city.name, from: currentCity.city.name)
        }

        positions[character] = route!.v
    }

    public var textualGraph:String {
        return graph.description
    }

    private static func createPandemicMap() -> WeightedGraph<GameBoardCity,OpenOrBlocked> {

        let graph = WeightedGraph<GameBoardCity,OpenOrBlocked>()

        let algiersIndex = graph.addVertex(GameBoardCity.algiers)
        let atlantaIndex = graph.addVertex(GameBoardCity.atlanta)
        let baghdadIndex = graph.addVertex(GameBoardCity.baghdad)
        let bangkokIndex = graph.addVertex(GameBoardCity.bangkok)
        let beijingIndex = graph.addVertex(GameBoardCity.beijing)
        let bogotaIndex = graph.addVertex(GameBoardCity.bogotá)
        let buenosairesIndex = graph.addVertex(GameBoardCity.buenosaires)
        let cairoIndex = graph.addVertex(GameBoardCity.cairo)
        let chennaiIndex = graph.addVertex(GameBoardCity.chennai)
        let chicagoIndex = graph.addVertex(GameBoardCity.chicago)
        let delhiIndex = graph.addVertex(GameBoardCity.delhi)
        let essenIndex = graph.addVertex(GameBoardCity.essen)
        let hochiminhcityIndex = graph.addVertex(GameBoardCity.hochiminhcity)
        let hongkongIndex = graph.addVertex(GameBoardCity.hongkong)
        let istanbulIndex = graph.addVertex(GameBoardCity.istanbul)
        let jakartaIndex = graph.addVertex(GameBoardCity.jakarta)
        let johannesburgIndex = graph.addVertex(GameBoardCity.johannesburg)
        let karachiIndex = graph.addVertex(GameBoardCity.karachi)
        let khartoumIndex = graph.addVertex(GameBoardCity.khartoum)
        let kinshasaIndex = graph.addVertex(GameBoardCity.kinshasa)
        let kolkataIndex = graph.addVertex(GameBoardCity.kolkata)
        let lagosIndex = graph.addVertex(GameBoardCity.lagos)
        let limaIndex = graph.addVertex(GameBoardCity.lima)
        let londonIndex = graph.addVertex(GameBoardCity.london)
        let losangelesIndex = graph.addVertex(GameBoardCity.losangeles)
        let madridIndex = graph.addVertex(GameBoardCity.madrid)
        let manilaIndex = graph.addVertex(GameBoardCity.manila)
        let mexicocityIndex = graph.addVertex(GameBoardCity.mexicocity)
        let miamiIndex = graph.addVertex(GameBoardCity.miami)
        let milanIndex = graph.addVertex(GameBoardCity.milan)
        let montrealIndex = graph.addVertex(GameBoardCity.montreal)
        let moscowIndex = graph.addVertex(GameBoardCity.moscow)
        let mumbaiIndex = graph.addVertex(GameBoardCity.mumbai)
        let newyorkIndex = graph.addVertex(GameBoardCity.newyork)
        let osakaIndex = graph.addVertex(GameBoardCity.osaka)
        let parisIndex = graph.addVertex(GameBoardCity.paris)
        let riyadhIndex = graph.addVertex(GameBoardCity.riyadh)
        let sanfranciscoIndex = graph.addVertex(GameBoardCity.sanfrancisco)
        let santiagoIndex = graph.addVertex(GameBoardCity.santiago)
        let saopauloIndex = graph.addVertex(GameBoardCity.sãopaulo)
        let seoulIndex = graph.addVertex(GameBoardCity.seoul)
        let shanghaiIndex = graph.addVertex(GameBoardCity.shanghai)
        let stpetersburgIndex = graph.addVertex(GameBoardCity.stpetersburg)
        let sydneyIndex = graph.addVertex(GameBoardCity.sydney)
        let taipeiIndex = graph.addVertex(GameBoardCity.taipei)
        let tehranIndex = graph.addVertex(GameBoardCity.tehran)
        let tokyoIndex = graph.addVertex(GameBoardCity.tokyo)
        let washingtonIndex = graph.addVertex(GameBoardCity.washington)

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