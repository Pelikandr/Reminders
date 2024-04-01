//
//  MyListsView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 01.04.2024.
//

import SwiftUI

struct MyListsView: View {
    @ObservedObject var viewModel: MyListsViewModel

    init(viewModel: MyListsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                Text("My Lists")
                ForEach(viewModel.myLists) { myList in
                    HStack {
                        Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                            .font(.title)
                            .foregroundStyle(myList.color)
                        Text(myList.name)
                    }
                }
            }
        }
    }
}

#Preview {
    let context = DataSource.shared.persistentContainer.viewContext
    return MyListsView(viewModel: MyListsViewModel(context: context))
}
