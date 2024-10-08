//
//  ContentView.swift
//  Monty
//
//  Created by apple on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var monty = Monty()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Image(monty.playerWins ? "Winner" : "Loser")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 200, height: 200)
                    .opacity(monty.gameOver ? 1 : 0)
                    .transition(.opacity)
                    
                
                HStack {
                    Spacer()
                    
                    ForEach(monty.cards.indices, id: \.self) { index in
                        CardView(card: monty.cards[index])
                            .frame(width: 130, height: 195)
                            .onTapGesture {
                                if !monty.gameOver {
                                    monty.onCardTap(card: monty.cards[index])
                                }
                            }
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                Button(action: {
                    monty.newGame()
                }) {
                    Text("New Game")
                        .font(.largeTitle)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }

                .padding()
            }
            .onAppear {
                monty.newGame()
            }
            .background(Color(red: 0.0, green: 0.3, blue: 0.0).edgesIgnoringSafeArea(.all))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
