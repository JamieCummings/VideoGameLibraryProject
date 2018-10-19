//
//  EditGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/18/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

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
        
        print(gameToEdit.title)
        editTitle.text = gameToEdit.title
        editDiscription.text = gameToEdit.description
        
        
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
