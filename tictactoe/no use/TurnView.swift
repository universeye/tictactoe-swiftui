//
//  TurnView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/25.
//

import SwiftUI

struct TurnView: View {
    
    //@State var player: Player?
    @EnvironmentObject var circleVM: CircleVM
    
    var body: some View {
        HStack {
            Text("Turn: ")
            
            switch circleVM.player {
            case .bot:
                SFSymbols.xmark
            case .human:
                SFSymbols.circle
            default:
                Text("Start")
            }
        }
    }
}

struct TurnView_Previews: PreviewProvider {
    static var previews: some View {
        TurnView()
    }
}
