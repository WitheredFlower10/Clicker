//
//  ContentView.swift
//  Clicker
//
//  Created by HAKIM Justine on 01/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var score = 0
    @State var bestscore = 0
    @State var gameInProgress = false
    var body: some View {
        VStack {
            HStack {
                if score >= bestscore && score != 0 {
                    Image(systemName: "flame").font(.title)
                }
                Text("Score : \(score)").font(.title).padding()
            }
            if gameInProgress == true {
                Image(systemName: "plus.square").font(.largeTitle).foregroundColor(.blue)
                    .onTapGesture {
                        score = score + 1
                    }
            }
                Spacer()
            if gameInProgress == false {
                Button("Nouvelle partie") {
                    score = 0
                    gameInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
                                         gameInProgress = false
                        if score > bestscore {
                            bestscore = score
                        }
                    }
                }.padding(100)
            }
        }
    }
    
}
struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}
