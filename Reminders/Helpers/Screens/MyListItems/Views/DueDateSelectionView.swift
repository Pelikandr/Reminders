//
//  DueDateSelectionView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct DueDateSelectionView: View {
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar: Bool = false
    @Binding var dueDate: DueDate?

    var body: some View {
        Menu {
            Button {
                dueDate = .today
            } label: {
                VStack {
                    Text("Today \n \(Date.today.formatAsString)")
                }
            }

            Button {
                dueDate = .tomorrow
            } label: {
                VStack {
                    Text("Tomorrow \n \(Date.tomorrow.formatAsString)")
                }
            }

            Button {
                showCalendar = true
            } label: {
                Text("Custom")
            }
        } label: {
            Label(dueDate == nil ? "Add Date:" : dueDate!.title,
                  systemImage: Constants.Icons.calendar)
        }
        .menuStyle(.borderedButton)
        .fixedSize()
        .popover(isPresented: $showCalendar) {
            DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) { newValue in
                    dueDate = .custom(newValue)
                }
        }
    }
}

#Preview {
    DueDateSelectionView(dueDate: .constant(nil))
}
