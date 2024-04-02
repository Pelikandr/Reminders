//
//  ListItemCell.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct ListItemCell: View {
    @State private var active: Bool = false
    @State private var showPopover: Bool = false
    @State private var checked: Bool = false

    let item: MyListItemViewModel
    let delay = Delay()

    var onListItemDeleted: (MyListItemViewModel) -> Void = { _ in }
    var onListItemCompleted: (MyListItemViewModel) -> Void = { _ in }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: checked ? Constants.Icons.circleInsetFilled : Constants.Icons.circle)
                .font(.system(size: 14))
                .opacity(0.4)
                .onTapGesture {
                    checked.toggle()

                    if checked {
                        delay.performWork {
                            onListItemCompleted(item)
                        }
                    } else {
                        delay.cancel()
                    }
                }

            VStack(alignment: .leading) {
                Text(item.title)
                if let dueDate = item.dueDate {
                    Text(dueDate.title)
                        .opacity(0.4)
                        .foregroundStyle(dueDate.isPastDue ? .red : .primary)
                }
            }

            Spacer()

            if active {
                Image(systemName: Constants.Icons.multiplyCircle)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        onListItemDeleted(item)
                    }

                Image(systemName: Constants.Icons.exclaimationMarkCircle)
                    .foregroundStyle(.yellow)
                    .onTapGesture {
                        showPopover = true
                    }
                    .popover(isPresented: $showPopover) {
                        EditListItemView(
                            item: item,
                            onUpdated: {
                                showPopover = false
                            })
                    }
            }
        }
        .contentShape(Rectangle())
        .onHover { value in
            if !showPopover {
                active = value
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ListItemCell(item: MyListItemViewModel(myListItem: MyListItem()))
}
