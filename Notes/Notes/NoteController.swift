//
//  NoteDetail.swift
//  Notes
//
//  Created by Emily Mearns on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    private let keyNotesStored = "notesStored"
    
    static let sharedController = NoteController()
    
    var notes = [Note]()
    
    
    
    init() {
        loadPersistentStorage()
    }
    
    func addNote(note: Note) {
        notes.append(note)
        saveToPersistentStorage(note)
    }
    
    func loadPersistentStorage() {
        NSUserDefaults.standardUserDefaults().objectForKey(keyNotesStored) as? [[String: AnyObject]]
        guard let notesDictionaries = NSUserDefaults.standardUserDefaults().objectForKey(keyNotesStored) as? [[String: AnyObject]] else {
            return
        }
        notes = notesDictionaries.flatMap({Note(dictionary: $0)})
    }
    
    func updateNote(note: Note) {
        removeNote(note)
        addNote(note)
    }
    
    func removeNote(note: Note) {
        guard let indexOfNote = notes.indexOf(note) else {
            return
        }
        notes.removeAtIndex(indexOfNote)
        saveToPersistentStorage(note)
    }
    
    func saveToPersistentStorage(note: Note) {
        NSUserDefaults.standardUserDefaults().setObject(notes.map({$0.dictionaryCopy}), forKey: keyNotesStored)
    }
    
    
}