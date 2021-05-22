//
//  ContentView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LazyVGrid(
            columns: [ GridItem(.adaptive(minimum: 100, maximum: 300), spacing: 16) ],
            spacing: 16) {
            
            ForEach(0 ..< 9) { item in
                CircleViewWithAni()
                
            }
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
