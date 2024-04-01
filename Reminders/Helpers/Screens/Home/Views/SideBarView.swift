//
//  SideBarView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import SwiftUI

struct SideBarView: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("All items count 10")

            List(1..<10, id: \.self) { item in
                Text("List \(item)")
            }

            Spacer()

            Button {
                isPresented = true
            } label: {
                Image(systemName: Constants.Icons.plusCircle)
                Text("Add list")
            }
            .buttonStyle(.plain)
            .padding()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            isPresented = false
        }, content: {
            AddNewListView(
                viewModel: AddNewListViewModel(context: context)
            )
        })
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
