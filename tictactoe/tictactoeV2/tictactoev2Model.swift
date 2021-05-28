//
//  tictactoev2Model.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/28.
//

import Foundation


enum Player2 {
    case human, bot
}

struct Move: Identifiable, Hashable {
    var id = UUID()
    var player: Player2
    var boardIndex: Int
    
    var indicator: String {
        if player == .bot {
            return "xmark"
        } else {
            return "circle"
        }
    }
    
    var isTapped: Bool
}
