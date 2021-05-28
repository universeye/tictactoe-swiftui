//
//  tictactoev2View.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/26.
//

import SwiftUI


struct tictactoev2View: View {
    
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    LazyVGrid(columns: viewModel.layout, spacing: 20) {
                        ForEach(0..<9) { index in
                            ZStack {
                                GameSquareView(proxy: geo)
                                PlayerIndicator(imageName: viewModel.moves[index]?.indicator ?? "cursorarrow.click")
                            }
                            .onTapGesture {
                                viewModel.gameLogic(index: index)
                            }
                            .allowsHitTesting(viewModel.isComputerMove) //If computer is moving, disable all the board
                            .allowsHitTesting(viewModel.moves[index]?.isTapped ?? true) //if tapped made, disable button
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        viewModel.moves = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
                    }, label: {
                        Text("Replay")
                    })
                }
                .alert(item: $viewModel.alertItem) { alert -> Alert in
                    Alert(title: alert.title, message: alert.message, dismissButton: .default(alert.buttonTitle, action: viewModel.resetGame))
                }
                .navigationTitle("Tic Tac Toe")
            }
        }
    }
}

struct tictactoev2View_Previews: PreviewProvider {
    static var previews: some View {
        tictactoev2View()
    }
}



struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.6)
            .frame(width: proxy.size.width / 3 - 15, height: 199)
    }
}


struct PlayerIndicator: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 46, weight: .bold))
            .foregroundColor(.white)
    }
}
