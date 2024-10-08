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
    }
}
