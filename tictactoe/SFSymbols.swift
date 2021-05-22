//
//  SFSymbols.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI

enum SFSymbols: String, View {
    case xmark = "xmark"
    case circle = "circle"
    
    var body: some View {
        Image(systemName: self.rawValue)
    }
}
