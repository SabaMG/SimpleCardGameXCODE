//
//  ContentView.swift
//  War Card Game
//
//  Created by Tristan Faure on 13/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var card1 = "back"
    @State var card2 = "back"
    @State var tie = ""
    @State var player = 0
    @State var CPU = 0
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                Text(tie)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                    .foregroundStyle(.white)
                HStack {
                    Spacer()
                    Image(card1)
                    Spacer()
                    Image(card2)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    shuffled()
                }) {
                    Image("button")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 10)
                        Text(String(player))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 10)
                        Text(String(CPU))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    func shuffled() {
        let i1 = Int.random(in: 2...14)
        let i2 = Int.random(in: 2...14)
        card1 = "card" + String(i1)
        card2 = "card" + String(i2)
        if i1 > i2 {
            tie = ""
            player += 1
        } else if i1 < i2 {
            tie = ""
            CPU += 1
        } else {
            tie = "It's a tie!"
        }
    }
}


#Preview {
    ContentView()
}
