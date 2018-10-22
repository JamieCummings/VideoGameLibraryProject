//
//  game.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/16/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit
import RealmSwift

class Game: Object {
     @objc dynamic var title: String = ""
     @objc dynamic var gameDescription: String = ""
     @objc dynamic var dueDate: Date? = nil
     @objc dynamic var checkedIn: Bool = true
     @objc dynamic var genre: String = ""
     @objc dynamic var rating: String = ""
    
    
    
}
