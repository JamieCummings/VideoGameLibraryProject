//
//  utilities .swift
//  VideoGameLibraryProject
//
//  Created by Jamie Cummings on 10/18/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

// this is for storing func that will be called through out the app that wont fit in to another file

func formatDate(_ date:Date) -> String {
    let formatter = DateFormatter()
    
    
    // dateFormatter.dayStyle = .medium this will allow you to set different default date styles
    
    formatter.dateFormat = "MMM d, yyyy"
    
    let formattedString = formatter.string(from: date)
    
    return formattedString
}
