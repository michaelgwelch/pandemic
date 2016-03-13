//: Playground - noun: a place where people can play

import Cocoa
import Pandemic


let builder = GameBoardBuilder()
builder.initialCity = City.riyadh
try! builder.addPlayerWithName("tim", andProfession: .Scientist)
try! builder.addPlayerWithName("mike", andProfession: .Generalist)

let board = builder.createGame()


board.textualGraph
let graph = board.textualGraph
