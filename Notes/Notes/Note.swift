//
//  Note.swift
//  Notes
//
//  Created by Emily Mearns on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let keyBodyTextField = "bodyTextField"
    
    var bodyTextField: String
    
    init(bodyTextField: String) {
        self.bodyTextField = bodyTextField
    }
    
    var dictionaryCopy: [String: AnyObject] {
        return [keyBodyTextField: bodyTextField]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let bodyTextField = dictionary[keyBodyTextField] as? String else {
            return nil
        }
        self.bodyTextField = bodyTextField
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return(lhs.bodyTextField == rhs.bodyTextField)
}

