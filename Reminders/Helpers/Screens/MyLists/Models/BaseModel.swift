//
//  BaseModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?

    func save() throws
    func delete() throws
}

extension BaseModel where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        DataSource.shared.persistentContainer.viewContext
    }

    static func byId<T>(id: NSManagedObjectID) -> T? {
        viewContext.object(with: id) as? T
    }

    func save() throws {
        try Self.viewContext.save()
    }

    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
