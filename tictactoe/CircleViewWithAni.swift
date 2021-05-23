//
//  CircleViewWithAni.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/22.
//

import SwiftUI



struct CircleViewWithAni: View {
    
    @EnvironmentObject var circleVM: CircleVM
    
    @Binding var botArray: Set<Int>
    @Binding var playerArray: Set<Int>
    var index: Int
    
    @Binding var round: Int
    let winningFormula: [Int] = [0,1,2]
    
    var body: some View {
        ZStack {
            if circleVM.player == .bot {
                CircleView(xorO: .circle)
            } else if circleVM.player == .human {
                CircleView(xorO: .xmark)
            } else {
                CircleView()
                    .onTapGesture {
                        
                        gameLogic()
                        print("botArray: \(botArray)")
                        print("player array: \(playerArray)")
                        botArray.containss(1, 2, 0)
                    }
            }
        }
    }
    
    
    
    func gameLogic() {
        withAnimation(.easeInOut) {
            if (round % 2) == 1 {
                circleVM.player = .bot
                botArray.insert(index)
            } else if (round % 2) == 0 {
                circleVM.player = .human
                playerArray.insert(index)
            }
            self.round += 1
        }
    }
}

struct CircleViewWithAni_Previews: PreviewProvider {
    static var previews: some View {
        CircleViewWithAni(botArray: .constant([45]), playerArray: .constant([4]), index: 3, round: .constant(4))
            .previewLayout(.sizeThatFits)
    }
}



extension Set {
    
    func containss(_ int1: Int, _ int2: Int, _ int3: Int) {
        if self.contains(int1 as! Element) && self.contains(int2 as! Element) && self.contains(int3 as! Element) {
            print("Yes!")
        }
    }
}
