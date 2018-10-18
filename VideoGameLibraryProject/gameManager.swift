//
//  gameManager.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/17/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation
class GameManager {
// shared instance of the GameManager class
    static let sharedInstance = GameManager() 
// we are creating a private initalizer so that no instance of this class can  be made anywhere else
    private init () {
        gameArray[0].dueDate = Date() 
    }
    
    
    // the array of games that will be useed throughout the application
    
    private var gameArray = [Game(title: "NBA2K", description: "basketball", genre: "sport", rating: "E"), Game(title: "blah", description: "blah2", genre: "MMO", rating: "T")]
        
    // function to get the number of games we have
        func getGameCount() -> Int{
            return gameArray.count
        }
        
    // function to return a game at a specific index
        func getGame(at index: Int) -> Game{
            return gameArray[index]
        }
    
    //func to add a game to the game library 
    func addGame(game: Game) {
        gameArray.append(game)
    }

    // func to remove a game from the library using the index we want to remove 
    func removeGame(at index: Int){
        gameArray.remove(at: index)
    }

}
