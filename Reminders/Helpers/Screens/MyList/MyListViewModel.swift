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

    init(myList: MyList) {
        self.myList = myList
    }
}
