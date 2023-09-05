//
//  ViewController.swift
//  demo
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import UIKit

class ViewController: UIViewController {
    var player1 : SnakesLadderPlayer?
    var player2 : SnakesLadderPlayer?
    let game : SnakeLadderGame = SnakeLadderGame()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        designGame()
        player1 = SnakesLadderPlayer("Ram", game: game)
        player2 = SnakesLadderPlayer("Shyam", game: game)
        play()
        // Do any additional setup after loading the view.
    }
    
    func designGame() {
        game.createABoard()
        game.printTheBoard()
        print(game.createSnakes(finalV: 12, initial: 2))
        print(game.createSnakes(finalV: 22, initial: 11))
        print(game.createSnakes(finalV: 99, initial: 10))
        print(game.createSnakes(finalV: 12, initial: 10))
        print(game.createSnakes(finalV: 6, initial: 2))
        print(game.createSnakes(finalV: 28, initial: 11))
        print(game.createSnakes(finalV: 19, initial: 10))
        print(game.createSnakes(finalV: 3, initial: 4))
        print(game.createLadders(initial: 21, finalV: 44))
        print(game.createLadders(initial: 3, finalV: 50))
        print(game.createLadders(initial: 21, finalV: 44))
        print(game.createLadders(initial: 33, finalV: 4))
        print(game.createLadders(initial: 2, finalV: 14))
        print(game.createLadders(initial: 4, finalV: 14))
        print(game.createLadders(initial: 5, finalV: 14))
    }
    
    func play() {
        for _ in 0..<10 {
            player1?.rollTheDice()
            player2?.rollTheDice()
        }
    }

}

