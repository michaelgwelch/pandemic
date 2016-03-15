//: Playground - noun: a place where people can play

import Cocoa
import Pandemic

PlayerCardDeck.shuffledDeck().cards.forEach {
    print($0)
}



PlayerCardDeck.shuffledDeck().cards.count


//
//let builder = GameEngineBuilder()
//try! builder.addPlayerWithName("tim", andProfession: .Medic)
//try! builder.addPlayerWithName("mark", andProfession: .Scientist)
//
//let engine = builder.createGame()
//print (engine.debugDescription)
//
//try! engine.driveOrFerryToCity("Miami")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("Bog")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("paulo")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("lagos")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("chicago")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("san ")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("tokyo")
//print(engine.debugDescription)
//
//try! engine.driveOrFerryToCity("osaka")
//print(engine.debugDescription)
//
//
