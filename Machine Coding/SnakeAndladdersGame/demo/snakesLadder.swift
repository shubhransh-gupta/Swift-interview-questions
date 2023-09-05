//
//  snakesLadder.swift
//  demo
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import Foundation

//protocol RollDiceDelegate : AnyObject {
//    func rollTheDice()
//}

class SnakesLadderPlayer : SnakeLadderGame {
    
    var dice : Int = 1
    
    var usersCurrentPosition : Int = 0
    
    var playerName : String?
    var game : SnakeLadderGame?
    
    init(_ name : String, game : SnakeLadderGame) {
        self.playerName = name
        self.game = game
    }

    func checkIfUserReachedAnySnakeOrLadder() {
        if let game = self.game {
            if game.snakes.contains(where: { $0.key == usersCurrentPosition }) {
                print("Player \(String(describing: self.playerName ?? "")) is bitten by snake of \(usersCurrentPosition) : \(String(describing: game.snakes[usersCurrentPosition]))" )
                usersCurrentPosition = game.snakes[usersCurrentPosition] ?? usersCurrentPosition
            } else if game.ladders.contains(where: { $0.key == usersCurrentPosition }) {
                print("Player \(String(describing: self.playerName ?? "")) took a ladder from \(usersCurrentPosition) : \(String(describing: game.ladders[usersCurrentPosition]))" )
                usersCurrentPosition = game.ladders[usersCurrentPosition] ?? usersCurrentPosition
            } else {
                print("Player \(String(describing: self.playerName ?? "" )) reached at : \(usersCurrentPosition)" )
            }
        }
    }
    
    func rollTheDice() {
        dice = Int.random(in: 1...6)
        usersCurrentPosition += dice
        checkIfUserReachedAnySnakeOrLadder()
    }
    
}

class SnakeLadderGame {
    var board = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
    
    var ladders : [Int : Int] = [:]
    
    var snakes : [Int : Int] = [:]
    
    func printTheBoard() {
        print(self.board)
    }
    
    
    func createABoard() {
        for i in 0..<10 {
            board[0][i] = i
        }
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = (i) * 10 + (j+1)
            }
        }
    }
    
    
    func createLadders(initial : Int, finalV : Int) -> Bool {
        guard initial < finalV else {
            return false
        }
        ladders[initial] = finalV
        return true
    }
    
    func createSnakes(finalV : Int, initial : Int) -> Bool {
//        ladders[2] = 12
        guard initial < finalV else {
            return false
        }
        snakes[finalV] = initial
        return true
    }
    
}
