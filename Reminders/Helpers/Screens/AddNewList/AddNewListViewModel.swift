//
//  AddNewListViewModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import Foundation
import SwiftUI
import CoreData

class AddNewListViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var color: Color = .blue

    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func save() {
        do {
            let myList = MyList(context: context)
            myList.name = name
            myList.color = NSColor(color)
            try myList.save()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
