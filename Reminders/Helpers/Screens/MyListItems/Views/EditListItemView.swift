//
//  EditListItemView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct EditListItemView: View {
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar: Bool = false

    @ObservedObject var editListItemViewModel: EditListItemViewModel

    var item: MyListItemViewModel
    var calendarButtonTitle: String {
        editListItemViewModel.selectedDate != nil ? editListItemViewModel.selectedDate!.formatAsString: "Add Date"
    }

    var onUpdated: () -> Void

    init(item: MyListItemViewModel,
         onUpdated: @escaping () -> Void) {
        self.item = item
        editListItemViewModel = EditListItemViewModel(listItemViewModel: item)
        self.onUpdated = onUpdated
    }

    var body: some View {
        VStack(alignment: .leading) {
            TextField(item.title, text: $editListItemViewModel.title)
                .textFieldStyle(.plain)
            Divider()
            HStack {
                Text("Due Date:")
                CalendarButtonView(
                    title: calendarButtonTitle,
                    showCalendar: $showCalendar,
                    onSelected: { selectedDate in
                        editListItemViewModel.selectedDate = selectedDate
                    })

                Spacer()
                HStack {
                    Button("Done") {
                        editListItemViewModel.save()
                        onUpdated()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(minWidth: 200, minHeight: 200)
    }
}

#Preview {
    let viewContext = DataSource.shared.persistentContainer.viewContext
    return EditListItemView(item: MyListItemViewModel(myListItem: MyListItem(context: viewContext)), onUpdated: { })
}
