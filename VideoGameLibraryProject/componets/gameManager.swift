//
//  gameManager.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/17/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation
import RealmSwift
import UserNotifications

class GameManager {
    // shared instance of the GameManager class
    static let sharedInstance = GameManager() 
    
    // we are creating a private initalizer so that no instance of this class can  be made anywhere else
    private init () {
        gameArray = realm.objects(Game.self)
    }
    
    
    // Results container for storing our Games. This function very similarly to an array or dictionary.
    private var gameArray: Results<Game>
    
    //tries to create a reference to the local Realm database
    let realm = try! Realm()
    
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
        try! realm.write {
            realm.add(game)
        }
    }
    
    // func to remove a game from the library using the index we want to remove
    func removeGame(at index: Int){
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    //func to check in or out a game
    func checkGameInOrOut(at index: Int) {
        
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            gameForIndex.checkedIn = !gameForIndex.checkedIn
            
            if gameForIndex.checkedIn {
                // remove any existing due date
                gameForIndex.dueDate = nil
            } else{
                //add a new due date, since the game has just been checked out
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
                
                // schedule a local notification at the time of the game's due date
                let center  = UNUserNotificationCenter.current()
                
                let content = UNMutableNotificationContent()
                content.title = gameForIndex.title
                content.body = "Your game is due!"
                
                let triggerDate =
                    Calendar.current.dateComponents([.year,.month, .day, .hour, .minute, .second], from: gameForIndex.dueDate!)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                let identifier = gameForIndex.title
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                
                center.add(request, withCompletionHandler: {error in if let error = error{
                    //something went wrong
                    print(error.localizedDescription)
                    }})
            }
            
        }
    }
}
