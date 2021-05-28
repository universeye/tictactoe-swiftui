//
//  tictactoeViewModel.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/28.
//

import SwiftUI

final class TicTacToeViewModel: ObservableObject {
    
    let layout = [ GridItem(.adaptive(minimum: 100), spacing: 20) ]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isComputerMove = true
    @Published var alertItem: AlertItem?
    private let winPatterns: Set<Set<Int>> = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    func gameLogic(index: Int) {
        if isSquareOccupied(in: moves, forIndex: index) { return }
        moves[index] = Move(player: .human, boardIndex: index, isTapped: false)
        
        //UnTappedIndex = UnTappedIndex.filter { $0 != index } //get rid of tapped index
        
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWin
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            return
        }
        
        isComputerMove = false //disable all the board
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [self] in
            //capture self in the beginning, so u don't have to type self everywhere.
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
    
    func isSquareOccupied(in move: [Move?], forIndex index: Int) -> Bool {
        return move.contains { $0?.boardIndex == index }
    }
    
    func determineComputerMovePosition(in movess: [Move?]) -> Int {
        
        //AI can win, then win
        var theMoves = moves.compactMap { $0 }.filter { $0.player == .bot }
        var thePosotion = Set(theMoves.map { $0.boardIndex })
        
        if let winCondition1 = calculateWinPosition(thePosition: thePosotion) {
            return winCondition1
        }
        
        //if Ai can't win, then block
        theMoves = moves.compactMap { $0 }.filter { $0.player == .human }
        thePosotion = Set(theMoves.map { $0.boardIndex })

        if let winCondition2 = calculateWinPosition(thePosition: thePosotion) {
            return winCondition2
        }
        
        //if ai cant block, then put in the middle
        let centerSquares = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquares) {
            return centerSquares
        }
        
        //AI takes random
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: movess, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    func calculateWinPosition(thePosition thePosotion: Set<Int>) -> Int? {
        var winPositions: Set<Int>
        
        for pattern in winPatterns {
            winPositions = pattern.subtracting(thePosotion)
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                
                if isAvailable {
                    return winPositions.first!}
            }
        }
        return nil
    }
    
    func checkWinCondition(for player: Player2, in moves: [Move?]) -> Bool {
        
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
    }
    
}
