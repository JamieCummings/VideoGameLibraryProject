//
//  addGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/17/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class addGameViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // this func shows how many componets the view needs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // func shows how many rows are needed on the view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // func gives the title for the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // these are the genres that the picker will use
    var pickerData: [String] = ["Massively Multiplayer Online", "Simulations", "Adventure", "Real-Time Strategy","Puzzle", "Action", "Stealth Shooter", "Combat","First Person Shooters","Sports","Role-Playing","Educational"]
    
    @IBOutlet weak var newTitleTextField: UITextField!
    @IBOutlet weak var genrePicker: UIPickerView!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    @IBOutlet weak var discriptionText: UITextView!
    @IBOutlet weak var addNewGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to add a new game.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    //This will run when the new game button is tapped
    @IBAction func newGameButtonTapped(_ sender: Any) {
        guard let title = newTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = discriptionText.text,
            gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
        }
        // shows the ratig is a variable 
        var rating: String!
        
        // this will take the input selected in the segment
        switch ratingSegment.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        default:
            rating = "E"
            
        }
        
        // get the genre for the Game
        let genre = pickerData[genrePicker.selectedRow(inComponent: 0)]
        
        //default initalizer for the Game class, this will create a Game using the default values that were set in the Game class.
        let newGame = Game()
        //setting the properties for the new game using dot notation
        newGame.title = title
        newGame.gameDescription = gameDescription
        newGame.genre = genre
        newGame.rating = rating
        
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameLibrary", sender: self)
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
