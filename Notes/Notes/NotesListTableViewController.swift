//
//  NotesListTableViewController.swift
//  Notes
//
//  Created by Emily Mearns on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {

    var note = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - IBActions
    
    @IBAction func addButtonPressed(sender: AnyObject) {
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.sharedController.notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)

        let note = NoteController.sharedController.notes[indexPath.row]
        cell.textLabel?.text = note.bodyTextField
        cell.detailTextLabel?.text = "DateHere"

        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let note = NoteController.sharedController.notes[indexPath.row]
            NoteController.sharedController.removeNote(note)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toViewNote" {
            if let noteDetailVC = segue.destinationViewController as? NoteDetailViewController {
                if let noteCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(noteCell) {
                        noteDetailVC.note = NoteController.sharedController.notes[indexPath.row]
                    }
                }
            }
        }
    }
    
}







