//
//  CircleViewModel.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/24.
//

import Foundation

enum Player {
    case bot, human
}

class CircleVM: ObservableObject {
    
    @Published var player: Player?
    
}
