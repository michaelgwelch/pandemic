//
//  GameBoard.swift
//  Pandemic
//
//  Created by Michael Welch on 3/12/16.
//  Copyright © 2016 Michael Welch. All rights reserved.
//

import Foundation
private struct NoWeight : Comparable, Summable {
    private init() {}
    static let value:NoWeight = NoWeight()
}

private func +(lhs: NoWeight, rhs: NoWeight) -> NoWeight {
    return lhs
}
private func <(lhs:NoWeight, rhs:NoWeight) -> Bool {
    return false
}

private func ==(lhs:NoWeight, rhs:NoWeight) -> Bool {
    return true
}

public class GameBoard {


    private var positions:[Pandemic.Character:Int]

    private let graph:WeightedGraph<City,NoWeight>


    init(withCharacters characters:[Pandemic.Character], inCity city:City) {

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

    func executeAction(action:CanTakeAction) throws {
        try action.execute(self)
    }


    private static func createPandemicMap() -> WeightedGraph<City,NoWeight> {

        let graph = WeightedGraph<City,NoWeight>()

        let atlantaIndex = graph.addVertex(City.atlanta)
        let miamiIndex = graph.addVertex(City.miami)
        let chicagoIndex = graph.addVertex(City.chicago)
        let montrealIndex = graph.addVertex(City.montreal)
        let washingtonIndex = graph.addVertex(City.washington)

        // Start with edges
        graph.addEdge(atlantaIndex, to: miamiIndex, weight: NoWeight.value)
        graph.addEdge(atlantaIndex, to: washingtonIndex, weight: NoWeight.value)
        graph.addEdge(atlantaIndex, to: chicagoIndex, weight: NoWeight.value)
        graph.addEdge(washingtonIndex, to: montrealIndex, weight: NoWeight.value)
        graph.addEdge(chicagoIndex, to: montrealIndex, weight: NoWeight.value)

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

protocol CanTakeAction {
    func execute(board:GameBoard) throws
}


class Action : CanTakeAction {
    static let pass:CanTakeAction = PassAction()
    static func driveOrFerryToCity(cityName:String) -> CanTakeAction {
        return DriveOrFerryAction(toCityName: cityName)
    }

    func execute(board: GameBoard) throws {
        //nop
    }
    
}



class PassAction : Action {
    override func execute(board: GameBoard) {
        board._currentCharacterIndex = board._currentCharacterIndex.successor()
        if board._currentCharacterIndex == board.characters.endIndex {
            board._currentCharacterIndex = board.characters.startIndex
        }
    }
}

class DriveOrFerryAction : Action {
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