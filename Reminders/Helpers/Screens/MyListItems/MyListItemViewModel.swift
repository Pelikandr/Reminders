//
//  MyListItemViewModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import Foundation
import CoreData

struct MyListItemViewModel: Identifiable {
    private let myListItem: MyListItem
    let id = UUID()

    var listItemId: NSManagedObjectID {
        myListItem.objectID
    }

    var title: String {
        myListItem.title ?? "Title"
    }

    var dueDate: DueDate? {
        guard let date = myListItem.dueDate else { return nil }
        return DueDate.from(value: date)
    }

    var isCompleted: Bool {
        myListItem.isCompleted
    }

    init(myListItem: MyListItem) {
        self.myListItem = myListItem
    }
}
