//
//  AddNewListView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import SwiftUI

struct AddNewListView: View {
    @ObservedObject private var viewModel: AddNewListViewModel
    // TODO: replace with isPresented
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: AddNewListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New list")
                    .padding(.bottom, 20)

                HStack {
                    Text("Name")
                    TextField("", text: $viewModel.name)
                }

                HStack {
                    Text("Color")
                    ColorListView(selectedColor: $viewModel.color)
                }

                HStack {
                    Spacer()
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }

                    Button("OK") {
                        viewModel.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(viewModel.name.isEmpty)
                }
            }
            .frame(minWidth: 300)
            .padding()
        }
    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataSource.shared.persistentContainer.viewContext

        AddNewListView(
            viewModel: AddNewListViewModel(context: viewContext)
        )
    }
}
