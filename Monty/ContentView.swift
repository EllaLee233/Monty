//
//  ContentView.swift
//  Monty
//
//  Created by apple on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(monty.cards, id: \.self) { card in
                    CardView(card: card)
                        .onTapGesture {
                            monty.onCardTap(card: card)
                        }
                }
            }
            Button(action: {
                monty.newGame()
            }) {
                Text("New Game")
            }
            .padding()
            
            if monty.gameOver {
                Image(monty.playerWins ? "winner" : "loser")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .onAppear {
            monty.newGame()
        }
    }
}

#Preview {
    ContentView()
}
