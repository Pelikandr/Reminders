//
//  MyListViewModel.swift
//  Reminders
//
//  Created by Denys Zaiakin on 01.04.2024.
//

import Foundation
import SwiftUI
import CoreData

class MyListsViewModel: NSObject, ObservableObject {
    @Published var myLists = [MyListViewModel]()

    private let fetchedResultsController: NSFetchedResultsController<MyList>
    private var context: NSManagedObjectContext

    var allListItemsCount: Int {
        myLists.reduce(0) { sum, viewModel in
            sum + viewModel.itemsCount
        }
    }

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: MyList.all,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        super.init()
        fetchedResultsController.delegate = self

        setupObservers()
        fetchAll()
    }

    @objc private func objectManagedContextObjectsDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let updates = userInfo[NSUpdatedObjectsKey] as? Set<MyListItem>, updates.count > 0 else { return }

        fetchAll()
    }

    // MARK: - List
    func delete(_ myList: MyListViewModel) {
        let myList: MyList? = MyList.byId(id: myList.id)
        if let myList {
            try? myList.delete()
        }
    }

    // MARK: - List items
    func saveTo(list: MyListViewModel, title: String, dueDate: Date?) {
        let myListItem = MyListItem(context: context)
        myListItem.title = title
        myListItem.dueDate = dueDate
        myListItem.myList = MyList.byId(id: list.id)

        do {
            try myListItem.save()
        } catch {
            print(error)
        }
    }

    func markAsCompleted(_ item: MyListItemViewModel) {
        let myListItem: MyListItem? = MyListItem.byId(id: item.listItemId)
        if let myListItem {
            myListItem.isCompleted = true
            try? myListItem.save()
        }
    }

    func deleteItem(_ item: MyListItemViewModel) {
        let myListItem: MyListItem? = MyListItem.byId(id: item.listItemId)
        if let myListItem {
            try? myListItem.delete()
        }
    }
}

// MARK: - Private
extension MyListsViewModel {
    private func fetchAll() {
        do {
            try fetchedResultsController.performFetch()
            guard let myLists = fetchedResultsController.fetchedObjects else { return }
            self.myLists = myLists.map(MyListViewModel.init)
        } catch {
            print(error)
        }
    }

    private func setupObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(objectManagedContextObjectsDidChange),
            name: NSNotification.Name.NSManagedObjectContextObjectsDidChange,
            object: context
        )
    }
}

extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else { return }
        self.myLists = myLists.map(MyListViewModel.init)
    }
}
