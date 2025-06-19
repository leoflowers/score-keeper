import Foundation

// Protocol for designating players as active or not.
// Reference: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols
protocol Playable {
    
}

struct Player: Identifiable, Playable {
    let id = UUID()
    
    var name: String
    var score: Int
}
