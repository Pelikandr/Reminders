//
//  MyListItemsView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct MyListItemsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            List(1...10, id: \.self) { index in
                Text("Item \(index)")
            }
        }

    }
}

#Preview {
    MyListItemsView()
}
