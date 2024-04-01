//
//  BaseModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import Foundation
import CoreData

protocol BaseModel {
    static var context: NSManagedObjectContext { get }
    func save() throws
}

extension BaseModel {
    static var context: NSManagedObjectContext {
        DataSource.shared.persistentContainer.viewContext
    }

    func save() throws {
        try Self.context.save()
    }
}
