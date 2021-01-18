//
//  SavedNotes+CoreDataProperties.swift
//  iOSRecruitment
//
//  Created by Yakoub on 16/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedNotes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedNotes> {
        return NSFetchRequest<SavedNotes>(entityName: "SavedNotes")
    }

    @NSManaged public var notes: String?
    @NSManaged public var id: Int16

}

extension SavedNotes : Identifiable {

}
