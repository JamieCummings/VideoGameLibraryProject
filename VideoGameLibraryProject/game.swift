//
//  game.swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/16/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var description: String
    var dueDate: Date?
    var checkedIn: Bool = true
    var genre: String
    var rating: String
    
    init(title: String, description: String, genre: String, rating: String){
        self.title = title
        self.description = description
        self.genre = genre
        self.rating = rating
    }
}
