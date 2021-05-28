//
//  CircleView2.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/26.
//

import SwiftUI

struct CircleView2: View {
    
    @State private var showGameX = false
    @State private var showGameO = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .onTapGesture {
                    
                    
                }
                
            
        }
        
    }
    
}

struct CircleView2_Previews: PreviewProvider {
    static var previews: some View {
        CircleView2()
            .previewLayout(.sizeThatFits)
    }
}
