//
//  CardView.swift
//  Monty
//
//  Created by apple on 10/7/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            if card.faceUp {
                Image(card.isAce ? "ace" : "blank")
                    .resizable()
                    .scaledToFit()
            } else {
                Image("card_back")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    CardView()
}
