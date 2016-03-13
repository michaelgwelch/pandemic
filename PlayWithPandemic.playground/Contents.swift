//: Playground - noun: a place where people can play

import Cocoa
import Pandemic

"são".lowercaseString
PlayerCard.saopaulo.name.lowercaseString
PlayerCard.saopaulo.name.lowercaseString.rangeOfString("são")
PlayerCard.allCards.findByName("são")


extension String {
    func left(n:Int) -> String {
        let rangeStart = self.characters.startIndex

        let rangeEnd = rangeStart.advancedBy(n, limit: self.characters.endIndex)

        return self.substringWithRange(rangeStart..<rangeEnd)
    }
}

//PlayerCard.findCharByName("Bog")
//PlayerCard.findCharByName("san ")
//PlayerCard.findCharByName("sao")



let a = "ab"
a.left(1)
a.left(2)
a.left(3)



let cards = PlayerCard.allCards
let names = cards.map { $0.name }


let abbreviations = names.map { $0.left(4) }
abbreviations.count

let uniqueAbbreviations:Set<String> = Set<String>(abbreviations)
uniqueAbbreviations.count
