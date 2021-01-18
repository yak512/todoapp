//
//  ToDoDetailViewController.swift
//  iOSRecruitment
//
//  Created by Yakoub on 14/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var myTaskDetail = SavedTask()
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        titleLabel.text = myTaskDetail.title
        textLabel.text = myTaskDetail.text
        super.viewDidLoad()
    }
    

  

}
