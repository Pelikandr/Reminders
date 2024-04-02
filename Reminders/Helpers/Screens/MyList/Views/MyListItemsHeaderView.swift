//
//  MyListItemsHeaderView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct MyListItemsHeaderView: View {
    let name: String
    let count: Int
    let color: Color

    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding()

            Spacer()
            Text("\(count)")
                .font(.system(size: 32))
                .foregroundColor(color)
                .padding()
        }
    }
}

#Preview {
    MyListItemsHeaderView(name: "Grocery", count: 6, color: .green)
}
