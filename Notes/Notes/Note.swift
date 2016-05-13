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
    private let keyTimestamp = "timestamp"
    
    var bodyTextField: String
    var timeStamp: NSDate
    
    init(bodyTextField: String, timestamp: NSDate) {
        self.bodyTextField = bodyTextField
        self.timeStamp = NSDate()
    }
    
    var dictionaryCopy: [String: AnyObject] {
        return [keyBodyTextField: bodyTextField, keyTimestamp: timeStamp]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let bodyTextField = dictionary[keyBodyTextField] as? String, timeStamp = dictionary[keyTimestamp] as? NSDate else {
            return nil
        }
        self.bodyTextField = bodyTextField
        self.timeStamp = timeStamp
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return(lhs.bodyTextField == rhs.bodyTextField && lhs.timeStamp == rhs.timeStamp)
}

