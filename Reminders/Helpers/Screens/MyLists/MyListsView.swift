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

                    NavigationLink {
                        MyListItemsHeaderView(
                            name: myList.name,
                            count: 6,
                            color: myList.color
                        )

                        MyListItemsView(
                            items: myList.items, 
                            onItemAdded: { title, dueDate in
                                viewModel.saveTo(
                                    list: myList,
                                    title: title,
                                    dueDate: dueDate
                                )
                            }, onItemDeleted: { item in
                                viewModel.deleteItem(item)
                            })
                    } label: {
                        HStack {
                            Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                                .font(.title)
                                .foregroundStyle(myList.color)
                            Text(myList.name)
                        }
                    }
                    .contextMenu {
                        Button {
                            viewModel.delete(myList)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
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
