//
//  GameLibraryViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/16/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gameLibraryTableView: UITableView!
    
    
    
    // This function can be used to tell how many sections we will have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this is where we tell the table view how many cells we will have in a given section
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! gameTableViewCell
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        cell.titleLabel.text = currentGame.title
        cell.ratingLabel.text = currentGame.rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        // if the game has a due date, we want to format it into a string and display it on the due
        if let dueDate = currentGame.dueDate { cell.dueDateLabel.text = formatDate(dueDate)
            
        } else {
            cell.dueDateLabel.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this func allows us to return an array of actions that the row will have, if any
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_
            , _) in
            // remove the game at the current index from our game array
            GameManager.sharedInstance.removeGame (at: indexPath.row)
            // delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [deleteAction]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Do any additional setup after loading the view.
    
    //this func will get called anytime we go back to this screen so that it updates
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameLibraryTableView.reloadData()
    }
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
