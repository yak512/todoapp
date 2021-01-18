//
//  ToDoTableViewCell.swift
//  iOSRecruitment
//
//  Created by Yakoub on 14/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewCell: UITableViewCell {

    var savedTasks = [SavedTask]()

    var cellId = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var doneSwitch: UISwitch!
    
    override func awakeFromNib() {
        loadData()
        graphic()
        doneSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        super.awakeFromNib()
    }
    
    @objc func switchValueDidChange(sender:UISwitch!) {
        
        let myCell = mySavedCell()
        if sender.isOn {
            myCell?.done = true
            PersistenceServiceTask.saveContext()
        } else {
            myCell?.done = false
            PersistenceServiceTask.saveContext()
        }
    }
    
    func configure(title: String, isDone: Bool, id: String) {
        titleLabel.text = title
        if isDone {
            doneSwitch.isOn = true
        } else {
            doneSwitch.isOn = false
        }
        cellId = id
    }
    
    func mySavedCell() -> SavedTask? {
        for savedTask in savedTasks {
            if self.cellId == savedTask.identifier {
                return savedTask
            }
        }
        return nil
    }
    
    
    func loadData() {
        let fetchRequest: NSFetchRequest<SavedTask> = SavedTask.fetchRequest()
        do {
            let savedTasks =  try PersistenceServiceTask.context.fetch(fetchRequest)
        self.savedTasks = savedTasks
        } catch {
            return
        }
    }
    
    func graphic() {
        viewCell.layer.cornerRadius = 8
        viewCell.backgroundColor = .systemYellow
    }

}
