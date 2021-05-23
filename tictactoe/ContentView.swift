//
//  ContentView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var circleVM: CircleVM
    @State private var round: Int = 1
    @State var botArray: Set<Int> = []
    @State var playerArray: Set<Int> = []
    
    var body: some View {
        VStack {
            Spacer()
            LazyVGrid(
                columns: [ GridItem(.adaptive(minimum: 100, maximum: 300), spacing: 16) ]) {
                
                ForEach(0 ..< 9) { index in
                    CircleViewWithAni(botArray: $botArray, playerArray: $playerArray, index: index, round: $round)
                        .environmentObject(CircleVM())
                    
                }
                
                
                
            }
            Spacer()
            Button(action: {
                circleVM.player = nil
            }, label: {
                Text("Replay")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
