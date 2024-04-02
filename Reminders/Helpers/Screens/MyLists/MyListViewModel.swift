//
//  ListViewModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 01.04.2024.
//

import Foundation
import CoreData
import SwiftUI

struct MyListViewModel: Identifiable {
    private let myList: MyList

    var id: NSManagedObjectID {
        myList.objectID
    }

    var name: String {
        myList.name ?? "List"
    }

    var color: Color {
        Color(myList.color ?? .clear)
    }

    var items: [MyListItemViewModel] {
        guard let items = myList.items, let myItems = (items.allObjects as? [MyListItem]) else { return [] }

        return myItems
            .filter { $0.isCompleted == false }
            .map(MyListItemViewModel.init)
    }

    var itemsCount: Int {
        items.count
    }

    init(myList: MyList) {
        self.myList = myList
    }
}
