//
//  ContentView.swift
//  example
//
//  Created by Leonel Flores on 6/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Leo", score: 0),
        Player(name: "Marian", score: 0),
        Player(name: "Natalie", score: 0),
        Player(name: "Sebastian", score: 0),
    ]
    
    var body: some View {
        @State var myValue: Bool = false
        
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player").gridColumnAlignment(.leading)
                    Text("Score")
                }
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                        // TODO: need to implement a protocol for Player for "enabled" feature
                        Toggle(isOn: $player.enabled) { Text("Enabled") }
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
