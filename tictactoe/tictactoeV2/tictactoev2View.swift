//
//  tictactoev2View.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/26.
//

import SwiftUI


struct tictactoev2View: View {
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    
    let layout = [
        GridItem(.adaptive(minimum: 100), spacing: 20)
    ]
    
    @State private var UnTappedIndex: [Int] = [0,1,2,3,4,5,6,7,8]
    @State private var isComputerMove = true //disable touch ability when the computer is making its move.
    @State private var alertItem: AlertItem?
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(0..<9) { index in
                        ZStack {
                            Circle()
                                .foregroundColor(.red).opacity(0.6)
                                .frame(width: geo.size.width / 3 - 15, height: 199)
                            
                            Image(systemName: moves[index]?.indicator ?? "cursorarrow.click")
                                    .font(.system(size: 46, weight: .bold))
                                    .foregroundColor(.white)
                            
                        }
                        .onTapGesture {
                            if isSquareOccupied(in: moves, forIndex: index) { return }
                            moves[index] = Move(player: .human, boardIndex: index, isTapped: false)
                            
                            UnTappedIndex = UnTappedIndex.filter { $0 != index } //get rid of tapped index
                            
                            if checkWinCondition(for: .human, in: moves) {
                                alertItem = AlertContext.humanWin
                                return
                            }
                            
                            if checkForDraw(in: moves) {
                                alertItem = AlertContext.draw
                                return
                            }
                            
                            isComputerMove = false //disable all the board
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                //computer making its move
                                //botMove()
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move(player: .bot, boardIndex: computerPosition, isTapped: false)
                                isComputerMove = true
                                
                                if checkWinCondition(for: .bot, in: moves) {
                                    alertItem = AlertContext.computerWin
                                    return
                                }
                                
                                if checkForDraw(in: moves) {
                                    alertItem = AlertContext.draw
                                    return
                                }
                                
                            }
                            
                            
                        }
                        .allowsHitTesting(isComputerMove) //If computer is moving, disable all the board
                        .allowsHitTesting(moves[index]?.isTapped ?? true) //if tapped made, disable button
                    }
                }
                .padding()
                
                Button(action: {
                    moves = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
                    UnTappedIndex = [0,1,2,3,4,5,6,7,8]
                }, label: {
                    Text("Replay")
                })
            }
            .alert(item: $alertItem) { alert -> Alert in
                Alert(title: alert.title, message: alert.message, dismissButton: .default(alert.buttonTitle, action: resetGame))
            }
        }
    }
    
    
    func botMove() {
        if UnTappedIndex.count == 0 { return }
        let randomIndex = UnTappedIndex.randomElement()
        UnTappedIndex = UnTappedIndex.filter { $0 != randomIndex } //get rid of tapped index
        moves[randomIndex!] = Move(player: .bot, boardIndex: randomIndex!, isTapped: false)
    }
    
    
    func isSquareOccupied(in move: [Move?], forIndex index: Int) -> Bool {
        return move.contains { $0?.boardIndex == index }
    }
    
    
    
    
    func determineComputerMovePosition(in movess: [Move?]) -> Int {
        //AI can win, then win
        let winPatterns: Set<Set<Int>> = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]
        let computerMoves = moves.compactMap { $0 }.filter { $0.player == .bot }
        let computerPosotion = Set(computerMoves.map { $0.boardIndex })
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPosotion)
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable {
                    print("nice")
                    return winPositions.first!}
            }
        }
        
        
        //AI takes random
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: movess, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: Player2, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player } //use compactMap to get rid of nils, and filter the player
        let playerPosotion = Set(playerMoves.map { $0.boardIndex })
        print("\(player) posotion: \(playerPosotion)")
        
        for pattern in winPatterns where pattern.isSubset(of: playerPosotion) {
            print("win")
            return true
        }

        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        UnTappedIndex = [0,1,2,3,4,5,6,7,8]
    }
    
}

struct tictactoev2View_Previews: PreviewProvider {
    static var previews: some View {
        tictactoev2View()
    }
}



