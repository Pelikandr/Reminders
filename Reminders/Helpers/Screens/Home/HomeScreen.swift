//
//  HomeScreen.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext

    var body: some View {
        NavigationView {
            let myListsViewModel = MyListsViewModel(context: context)
            let firstList = myListsViewModel.myLists.first

            SideBarView()
                .frame(minWidth: 200)

            if let firstList {
                MyListItemsHeaderView(
                    name: firstList.name,
                    count: firstList.itemsCount,
                    color: firstList.color
                )
                MyListItemsView(items: firstList.items)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
