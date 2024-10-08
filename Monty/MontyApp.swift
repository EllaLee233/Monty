//
//  MontyApp.swift
//  Monty
//
//  Created by apple on 10/7/24.
//

import SwiftUI
import Foundation
import Combine

@main
struct MontyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Monty: ObservableObject {
    @Published var gameOver: Bool = false
    @Published var playerWins: Bool = false
    
    private(set) var cards: [Card] = []
    
    func newGame() {
        gameOver = false
        playerWins = false
        
        cards = [
            Card(isAce: true),
            Card(isAce: false),
            Card(isAce: false)
        ]
        
        cards.shuffle()
    }
    func onCardTap(card: Card) {
        if !gameOver {
            card.faceUp = true
            gameOver = true
            playerWins = card.isAce
        }
    }
}

class Card: ObservableObject {
    @Published var faceUp: Bool = false
    let isAce: Bool
    
    init(isAce: Bool) {
        self.isAce = isAce
    }
}
