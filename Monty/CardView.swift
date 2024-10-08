//
//  CardView.swift
//  Monty
//
//  Created by apple on 10/7/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    
    var body: some View {
        ZStack {
            if card.faceUp {
                Image(card.isAce ? "Ace" : "blank")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 185)
                .clipped()
            } else {
                Image("back")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
                .clipped()
            }
        }
        .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(isAce: true))
            .previewLayout(.sizeThatFits)
    }
}
