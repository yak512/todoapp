//
//  AddTaskViewController.swift
//  iOSRecruitment
//
//  Created by Yakoub on 14/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    // MARK: - Properties
    var savedTasks = [SavedTask]()
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        graphic()
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func addTaskButton(_ sender: Any) {
        if titleLabel.text != "" && descriptionTextView.text != "" {
            saveTask()
        } else {
            presentAlert(title: "Error", message: "Please add a title and a description for your task")
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        descriptionTextView.resignFirstResponder()
        titleLabel.resignFirstResponder()
    }
    
    // MARK: - Helpers
    func graphic() {
        descriptionTextView.layer.cornerRadius = 15
        addTaskButton.layer.cornerRadius = 6
    }
    
    func saveTask() {
        let fetchRequest: NSFetchRequest<SavedTask> = SavedTask.fetchRequest()
        do {
            let savedTasks =  try PersistenceServiceTask.context.fetch(fetchRequest)
            self.savedTasks = savedTasks
        } catch {
            print("load data error")
            return
            }
        let task = SavedTask(context: PersistenceServiceTask.context)
        task.title = titleLabel.text
        task.text = descriptionTextView.text
        task.done = false
        task.identifier = UUID().uuidString
        PersistenceServiceTask.saveContext()
        savedTasks.append(task)
        
        descriptionTextView.text = ""
        titleLabel.text = ""
        presentAlert(title: "New Task Added", message: "Your task is successfully added")
    }
    
    private func presentAlert(title: String, message: String) {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVc, animated: true, completion: nil)
    }
    
    
}
