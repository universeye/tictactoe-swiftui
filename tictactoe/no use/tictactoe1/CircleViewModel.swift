//
//  CircleViewModel.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/24.
//

import Foundation

enum Player {
    case bot, human, no
}

class CircleVM: ObservableObject {
    
    @Published var player = Player.no
    @Published var isGameOver = false {
        didSet {
            print("isGameOVer is seted")
        }
    }
    
    
    func setIsgameTrue() {
        DispatchQueue.main.async {
            self.isGameOver = true
        }
       
    }
   
    
    
//    func insertBot(index: Int) {
//        botArray.insert(index)
//    }
//
//    func insertPlayer(index: Int) {
//        playerArray.insert(index)
//    }
}
