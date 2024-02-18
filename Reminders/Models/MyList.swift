//
//  MyList.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import Foundation
import CoreData
import AppKit

class MyList: NSManagedObject {

}

extension MyList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "List")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?

}

extension MyList: Identifiable {

}
