//
//  detailTransitionView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/25.
//

import SwiftUI

struct detailTransitionView: View {
    @State private var showDetails = false
    @EnvironmentObject var circleVM: CircleVM
    
        var body: some View {
            VStack {
                Button("Press to show details") {
                    withAnimation {
                        showDetails.toggle()
                    }
                }
                TurnView().environmentObject(self.circleVM)
                HStack {
                    Button(action: {
                        circleVM.player = .bot
                    }, label: {
                        Text("Button1")
                    })
                    Button(action: {
                        circleVM.player = .human
                    }, label: {
                        Text("Button2")
                    })
                }
                
                if showDetails {
                    // Moves in from the bottom
                    Text("Details go here.")
                        .transition(.move(edge: .bottom))

                    // Moves in from leading out, out to trailing edge.
                    Text("Details go here.")
                        .transition(.slide)

                    // Starts small and grows to full size.
                    Text("Details go here.")
                        .transition(.scale)
                }
            }
        }
}

struct detailTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        detailTransitionView()
    }
}
