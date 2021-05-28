//
//  Alerts.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/28.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}


struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                             message: Text("u beat ai"),
                             buttonTitle: Text("Rematch"))
    
    static let computerWin = AlertItem(title: Text("You Lose!"),
                             message: Text("AI beat u"),
                             buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw!"),
                             message: Text("what a battle!"),
                             buttonTitle: Text("Rematch"))
}
