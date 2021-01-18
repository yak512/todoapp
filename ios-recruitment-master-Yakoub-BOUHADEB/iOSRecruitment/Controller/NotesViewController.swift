//
//  NotesViewController.swift
//  iOSRecruitment
//
//  Created by Yakoub on 14/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UITextViewDelegate {

    // MARK: - Properties
    var myNotes = [SavedNotes]()
    
    // MARK: - Outlets
    @IBOutlet weak var notesTextField: UITextView!
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest: NSFetchRequest<SavedNotes> = SavedNotes.fetchRequest()
        do {
            let savedNotes =  try PersistenceServicesNotes.context.fetch(fetchRequest)
            myNotes = savedNotes
        } catch {
            return
        }
        if myNotes.count == 0 {
            firstSaveData()
        } else {
            findMyNotes()
        }
    }
    
   override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveData()
    }

    // MARK: - Helpers
    func findMyNotes() {
        for note in myNotes {
            if note.id == Int16(42) {
                notesTextField.text = note.notes
            }
        }
    }
    
    func saveData() {
        for note in myNotes {
            if note.id == Int16(42) {
                note.notes = notesTextField.text
                PersistenceServicesNotes.saveContext()
            }
        }
    }
    
    func firstSaveData() {
        let mySavedNotes = SavedNotes(context: PersistenceServicesNotes.context)
        mySavedNotes.notes = notesTextField.text
        mySavedNotes.id = Int16(42)
        PersistenceServicesNotes.saveContext()
        myNotes.append(mySavedNotes)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
               }
        return true
    }
}
