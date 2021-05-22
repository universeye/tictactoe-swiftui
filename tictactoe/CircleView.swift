//
//  CircleView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI

struct CircleView: View {
    
    var xorO: SFSymbols?
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .overlay(
                xorO
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white))
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleView()
            CircleView(xorO: .xmark)
            CircleView(xorO: .circle)
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        
        Group {
            CircleView(xorO: .xmark)
            CircleView(xorO: .circle)
        }
        .previewLayout(.sizeThatFits)
    }
}
