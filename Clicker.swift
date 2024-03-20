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
    @State var openNewWindow = false
    @State var timer = 10
    @State var t1 : Timer? = nil
    var body: some View {
        VStack {
            HStack {
                
                if score >= bestscore && score != 0 {
                    Image(systemName: "flag.2.crossed").font(.title)
                    
                 
                }
                Text("Score : \(score)").font(.title).padding()
                Text("\(timer)")
                
            }
            Spacer()
            if openNewWindow == false {
                
                    Button("Nouvelle partie") {
                        score = 0
                        openNewWindow = true
        
                    }.padding(100)
                
               
            }
        
            
            
            
            
            if openNewWindow == true {
                
                Image(systemName: "button.programmable").font(.largeTitle).foregroundColor(.blue)
                    .onTapGesture {
                        score = score + 1
                        if score == 1 {
                            gameInProgress = true
                            
                            
                            
                            
                            
                            t1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
                               
                                    timer-=1
                                
                                if(timer < 0) {
                                    sleep(1)
                                    timer = 10
                                    gameInProgress = false
                                    openNewWindow = false
                                    t1?.invalidate()
                                }
                                
                            }
                            
                            
                            
                            
                            
                        }
                       
                        
                    }
            }
        }
           
        }
    }
    

struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}

