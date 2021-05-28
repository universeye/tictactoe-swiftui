//
//  CircleViewWithAni.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/22.
//

import SwiftUI



struct CircleViewWithAni: View {
    
    @EnvironmentObject var circleVM: CircleVM
    var index: Int
    
    @Binding var botArray: Set<Int>
    @Binding var playerArray: Set<Int>
    @Binding var round: Int
    //@Binding var isGameOver: Bool
    
    let winningFormula: [Int] = [0,1,2]
    
    var body: some View {
        ZStack {
            if circleVM.player == .bot {
                CircleView(xorO: .circle)
            } else if circleVM.player == .human {
                CircleView(xorO: .xmark)
            } else if circleVM.player == .no {
                CircleView()
                    .onTapGesture {

                        gameLogic()
                        print("botarray: \(botArray)")
                        print("playerarray: \(playerArray)")
                        if botArray.containss(winningFormula) {
                            circleVM.setIsgameTrue()
                        }
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
        CircleViewWithAni(index: 3, botArray: .constant([]), playerArray: .constant([]), round: .constant(4))
            .previewLayout(.sizeThatFits)
    }
}





//MARK: - Extension

extension Set {
    
    func containss(_ int1: Array<Int>) -> Bool{
        if self.contains(int1[0] as! Element) && self.contains(int1[1] as! Element) && self.contains(int1[2] as! Element) {
            return true
        }
        return false
    }
}
