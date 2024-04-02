//
//  EditListItemViewModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import Foundation

class EditListItemViewModel: ObservableObject {
    var listItemViewModel: MyListItemViewModel

    @Published var title: String = ""
    @Published var selectedDate: Date?

    init(listItemViewModel: MyListItemViewModel) {
        self.listItemViewModel = listItemViewModel
        self.title = listItemViewModel.title
        self.selectedDate = listItemViewModel.dueDate != nil ? (listItemViewModel.dueDate?.value) : nil
    }

    func save() {
        let item: MyListItem? = MyListItem.byId(id: listItemViewModel.listItemId)
        guard let item else { return }
        item.title = title
        item.dueDate = selectedDate
        try? item.save()
    }
}
