//
//  addGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/17/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class addGameViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    var pickerData: [String] = ["Massively Multiplayer Online", "Simulations", "Adventure", "Real-Time Strategy","Puzzle", "Action", "Stealth Shooter", "Combat","First Person Shooters","Sports","Role-Playing","Educational"]
   
    @IBOutlet weak var newTitleTextField: UITextField!
    @IBOutlet weak var genrePicker: UIPickerView!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    @IBOutlet weak var discriptionTextField: UITextField!
    @IBOutlet weak var addNewGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newGameButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToGameLibraryList", sender: self)
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
