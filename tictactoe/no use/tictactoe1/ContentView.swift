//
//  ContentView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var circleVM: CircleVM
    //@State private var plaerrr = false
    @State private var round: Int = 1
    @State private var botArray: Set<Int> = []
    @State private var playerArray: Set<Int> = []
    @State private var isGameOver2 = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Spacer()
                
                
                LazyVGrid(
                    columns: [ GridItem(.adaptive(minimum: 100, maximum: 300), spacing: 16) ]) {
                    
                    ForEach(0 ..< 9) { index in
                        CircleViewWithAni(
                            index: index,
                            botArray: $botArray,
                            playerArray: $playerArray,
                            round: $round
                            )
                            .environmentObject(CircleVM())
                        
                    }
                    
                    
                    
                }
                Spacer()
                
                Button(action: {
                    isGameOver2.toggle()
                }, label: {
                    Text("isGameOver2")
                })
                
                Button(action: {
                    circleVM.player = .no
                    botArray = []
                    playerArray = []
                }, label: {
                    Text("Replay")
                })
            }
            if circleVM.isGameOver {
                SFSymbols.xmark
                    .font(.system(size: 200, weight: .bold))
            }
        }
    } //body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


