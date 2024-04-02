//
//  MyListItemsView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct MyListItemsView: View {
    typealias ItemAdded = ((String, Date?) -> Void)?
    typealias ItemDeleted = ((MyListItemViewModel) -> Void)?
    typealias ItemCompleted = ((MyListItemViewModel) -> Void)?

    var items: [MyListItemViewModel]
    var onItemAdded: ItemAdded
    var onItemDeleted: ItemDeleted
    var onItemCompleted: ItemCompleted

    init(items: [MyListItemViewModel], 
         onItemAdded: ItemAdded,
         onItemDeleted: ItemDeleted,
         onItemCompleted: ItemCompleted) {
        self.items = items
        self.onItemAdded = onItemAdded
        self.onItemDeleted = onItemDeleted
        self.onItemCompleted = onItemCompleted
    }

    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(items, id: \.listItemId) { item in
                    ListItemCell(
                        item: item,
                        onListItemDeleted: { item in
                            onItemDeleted?(item)
                        }, onListItemCompleted: { item in
                            onItemCompleted?(item)
                        }
                    )
                }

                AddNewListItemView { title, dueDate in
                    onItemAdded?(title, dueDate)
                }
            }
        }

    }
}

#Preview {
    MyListItemsView(items: [], onItemAdded: { _, _ in }, onItemDeleted: { _ in }, onItemCompleted: { _ in })
}
