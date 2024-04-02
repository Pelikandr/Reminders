//
//  AddNewListItemView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct AddNewListItemView: View {

    @State private var title: String = ""
    @State private var dueDate: DueDate?

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: Constants.Icons.circle)
                    .font(.system(size: 14))
                    .opacity(0.2)
                TextField("", text: $title)
            }

            Text("Notes")
                .opacity(0.2)
                .padding(.leading, 30)

            HStack {
                DueDateSelectionView(dueDate: $dueDate)

                Button("Clear") {
                    dueDate = nil
                }

                Button("Save") {

                }
            }.padding()
        }
    }
}

#Preview {
    AddNewListItemView()
}
