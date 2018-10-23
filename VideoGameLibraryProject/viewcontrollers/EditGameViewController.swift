//
//  EditGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/18/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit
import RealmSwift


class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var gameToEdit: Game!
    
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
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editDiscription: UITextField!
    @IBOutlet weak var editRatingSeg: UISegmentedControl!
    @IBOutlet weak var editGenrePicker: UIPickerView!
    @IBAction func submitEditButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(gameToEdit.description)
        editTitle.text = gameToEdit.title
        editDiscription.text = gameToEdit.gameDescription
        
        
        switch gameToEdit.rating {
        case "E":
            editRatingSeg.selectedSegmentIndex = 0
        case "E10+":
            editRatingSeg.selectedSegmentIndex = 1
        case "T":
            editRatingSeg.selectedSegmentIndex = 2
        case "M":
            editRatingSeg.selectedSegmentIndex = 3
        default:
            editRatingSeg.selectedSegmentIndex = 0
        }
        
        
        
        switch gameToEdit.genre {
        case "Massively Multiplayer Online":
            editGenrePicker.selectRow(0, inComponent: 0, animated: false)
        case "Simulations":
            editGenrePicker.selectRow(1, inComponent: 0, animated: false)
        case "Adventure":
            editGenrePicker.selectRow(2, inComponent: 0, animated: false)
        case "Real-Time Strategy":
            editGenrePicker.selectRow(3, inComponent: 0, animated: false)
        case "Puzzle":
            editGenrePicker.selectRow(4, inComponent: 0, animated: false)
        case "Action":
            editGenrePicker.selectRow(5, inComponent: 0, animated: false)
        case "Stealth Shooter":
            editGenrePicker.selectRow(6, inComponent: 0, animated: false)
        case "Combat":
            editGenrePicker.selectRow(7, inComponent: 0, animated: false)
        case "First Person Shooters":
            editGenrePicker.selectRow(8, inComponent: 0, animated: false)
        case "Sports":
            editGenrePicker.selectRow(9, inComponent: 0, animated: false)
        case "Role-Playing":
            editGenrePicker.selectRow(10, inComponent: 0, animated: false)
        case "Educational":
            editGenrePicker.selectRow(11, inComponent: 0, animated: false)
        default:
            editGenrePicker.selectRow(0, inComponent: 0, animated: false)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to add a new game.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        
        // this will allow the new edits to be submitted
        guard let title = editTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = editDiscription.text,
            gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
        }
        
        var rating: String!
        
        switch editRatingSeg.selectedSegmentIndex {
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
        
        let realm = try! Realm()
        
        try! realm.write {
            gameToEdit.title = title
            gameToEdit.gameDescription = gameDescription
            gameToEdit.rating = rating
            gameToEdit.genre = pickerData[editGenrePicker.selectedRow(inComponent: 0)]
        }
        
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
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
