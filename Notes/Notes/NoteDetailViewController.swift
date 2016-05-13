//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Emily Mearns on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var bodyTextField: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyTextField.delegate = self
        
        if let note = note {
            updateWith(note)
        }
    }
    
    func updateWith(note: Note) {
        bodyTextField.text = note.bodyTextField
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let note = note {
            guard let bodyTextField = bodyTextField.text else {
                return
            }
            note.bodyTextField = bodyTextField
            NoteController.sharedController.saveToPersistentStorage(note)
        } else {
            guard let bodyTextField = bodyTextField.text else {
                return
            }
            let note = Note(bodyTextField: bodyTextField, timestamp: NSDate())
            NoteController.sharedController.addNote(note)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        bodyTextField.text = ""
    }

}
