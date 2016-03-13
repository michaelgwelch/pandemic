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


public class GameBoardBuilder {

    public init() {
        
    }
    let rosterBuilder = RosterBuilder()
    public var initialCity = City.atlanta

    public func addPlayerWithName(name:String, andProfession profession:Profession) throws {
        try rosterBuilder.addPlayerWithCharacterName(name, andProfession: profession)
    }

    public func createGame() -> GameBoard {
        return GameBoard(withCharacters: rosterBuilder.characters, inCity: initialCity)
    }


}



public class GameBoard {


    private(set) public var positions:[Pandemic.Character:Int]

    private let graph:WeightedGraph<City,OpenOrBlocked>

    convenience init() {
        self.init(withCharacters: [], inCity:City.atlanta)
    }

    private init(withCharacters characters:[Pandemic.Character], inCity city:City) {

        graph = GameBoard.createPandemicMap()
        let indexOfCity = graph.indexOfVertex(city)!

        positions = [Character:Int](tuples: characters.map { ($0, indexOfCity) })
        self.characters = characters
        self._currentCharacterIndex = self.characters.startIndex

    }

    // TODO: Change this to return City. The Controller that we create
    // can validate that all methods input by user are valid before calling
    // into GameBoard.
    func positionOfCharacter(character:Character) -> City? {
        return graph[positions[character]!]
    }

    private var vertexOfCurrentCharacter:Int {
        return positions[currentCharacter]!
    }

    private(set) var characters:[Character]
    private var _currentCharacterIndex:Array<Character>.Index

    var currentCharacter:Character {
        return characters[_currentCharacterIndex]
    }

    func executeAction(action:Action) throws {
        try action.execute(self)
    }

    public var textualGraph:String {
        return graph.description
    }

    private static func createPandemicMap() -> WeightedGraph<City,OpenOrBlocked> {

        let graph = WeightedGraph<City,OpenOrBlocked>()

        let algiersIndex = graph.addVertex(City.algiers)
        let atlantaIndex = graph.addVertex(City.atlanta)
        let baghdadIndex = graph.addVertex(City.baghdad)
        let bangkokIndex = graph.addVertex(City.bangkok)
        let beijingIndex = graph.addVertex(City.beijing)
        let bogotaIndex = graph.addVertex(City.bogota)
        let buenosairesIndex = graph.addVertex(City.buenosaires)
        let cairoIndex = graph.addVertex(City.cairo)
        let chennaiIndex = graph.addVertex(City.chennai)
        let chicagoIndex = graph.addVertex(City.chicago)
        let delhiIndex = graph.addVertex(City.delhi)
        let essenIndex = graph.addVertex(City.essen)
        let hochiminhcityIndex = graph.addVertex(City.hochiminhcity)
        let hongkongIndex = graph.addVertex(City.hongkong)
        let istanbulIndex = graph.addVertex(City.istanbul)
        let jakartaIndex = graph.addVertex(City.jakarta)
        let johannesburgIndex = graph.addVertex(City.johannesburg)
        let karachiIndex = graph.addVertex(City.karachi)
        let khartoumIndex = graph.addVertex(City.khartoum)
        let kinshasaIndex = graph.addVertex(City.kinshasa)
        let kolkataIndex = graph.addVertex(City.kolkata)
        let lagosIndex = graph.addVertex(City.lagos)
        let limaIndex = graph.addVertex(City.lima)
        let londonIndex = graph.addVertex(City.london)
        let losangelesIndex = graph.addVertex(City.losangeles)
        let madridIndex = graph.addVertex(City.madrid)
        let manilaIndex = graph.addVertex(City.manila)
        let mexicocityIndex = graph.addVertex(City.mexicocity)
        let miamiIndex = graph.addVertex(City.miami)
        let milanIndex = graph.addVertex(City.milan)
        let montrealIndex = graph.addVertex(City.montreal)
        let moscowIndex = graph.addVertex(City.moscow)
        let mumbaiIndex = graph.addVertex(City.mumbai)
        let newyorkIndex = graph.addVertex(City.newyork)
        let osakaIndex = graph.addVertex(City.osaka)
        let parisIndex = graph.addVertex(City.paris)
        let riyadhIndex = graph.addVertex(City.riyadh)
        let sanfranciscoIndex = graph.addVertex(City.sanfrancisco)
        let santiagoIndex = graph.addVertex(City.santiago)
        let saopauloIndex = graph.addVertex(City.saopaulo)
        let seoulIndex = graph.addVertex(City.seoul)
        let shanghaiIndex = graph.addVertex(City.shanghai)
        let stpetersburgIndex = graph.addVertex(City.stpetersburg)
        let sydneyIndex = graph.addVertex(City.sydney)
        let taipeiIndex = graph.addVertex(City.taipei)
        let tehranIndex = graph.addVertex(City.tehran)
        let tokyoIndex = graph.addVertex(City.tokyo)
        let washingtonIndex = graph.addVertex(City.washington)

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



///////////////
// Actions below
/////

protocol Action {
    func execute(board:GameBoard) throws
}


class BaseAction : Action {
    static let pass:Action = PassAction()
    static func driveOrFerryToCity(cityName:String) -> Action {
        return DriveOrFerryAction(toCityName: cityName)
    }

    func execute(board: GameBoard) throws {
        //nop
    }

}



class PassAction : BaseAction {
    override func execute(board: GameBoard) {
        board._currentCharacterIndex = board._currentCharacterIndex.successor()
        if board._currentCharacterIndex == board.characters.endIndex {
            board._currentCharacterIndex = board.characters.startIndex
        }
    }
}

class DriveOrFerryAction : BaseAction {
    let cityName:String
    init(toCityName:String) {
        cityName = toCityName
    }
    override func execute(board: GameBoard) throws {
        let currentCity = board.graph.vertexAtIndex(board.vertexOfCurrentCharacter)

        let routesOut = board.graph.edgesForIndex(board.vertexOfCurrentCharacter)
        let route = routesOut.filter { edge in
            let edgeDestinationCity = board.graph.vertexAtIndex(edge.v)
            return edgeDestinationCity.name == self.cityName
            }.first

        guard route != nil else {
            throw ExecutionError.DriveOrFerryCityUnreachable(to: cityName, from: currentCity.name)
        }


        board.positions[board.currentCharacter] = route!.v
    }
}

enum ExecutionError : ErrorType {
    case DriveOrFerryCityUnreachable(to:String, from:String)
}
extension SequenceType {
    func first(includeElement: (Self.Generator.Element) -> Bool) -> Self.Generator.Element {
        return self.filter(includeElement).first!
    }
}