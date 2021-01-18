//
//  SavedTask+CoreDataProperties.swift
//  iOSRecruitment
//
//  Created by Yakoub on 15/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedTask> {
        return NSFetchRequest<SavedTask>(entityName: "SavedTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool
    @NSManaged public var text: String?
    @NSManaged public var identifier: String?

}

extension SavedTask : Identifiable {

}
