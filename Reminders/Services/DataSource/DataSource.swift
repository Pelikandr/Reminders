//
//  DataSource.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import Foundation
import CoreData

class DataSource {
    let persistentContainer: NSPersistentContainer
    static let shared = DataSource()

    private init() {
        ValueTransformer.setValueTransformer(
            NSColorTransformer(),
            forName: NSValueTransformerName("NSColorTransformer"))
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Faield to initialaze Core Data \(error)")
            }
        }
    }
}
