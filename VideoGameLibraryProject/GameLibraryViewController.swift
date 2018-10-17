//
//  GameLibraryViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/16/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameArray = [Game(title: "NBA2K", description: "basketball", genre: "sport", rating: "E"), Game(title: "blah", description: "blah2", genre: "MMO", rating: "T")]
    
    // This function can be used to tell how many sections we will have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this is where we tell the table view how many cells we will have in a given section
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! gameTableViewCell
        let currentGame = gameArray[indexPath.row]
        cell.titleLabel.text = currentGame.title
        cell.ratingLabel.text = currentGame.rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameArray[0].checkedIn = false
    }
        // Do any additional setup after loading the view.
        
    @IBAction func unwindToGameLibraryList(segue: UIStoryboardSegue){
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
