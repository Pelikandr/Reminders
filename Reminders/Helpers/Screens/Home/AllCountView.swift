//
//  AllCountView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import SwiftUI

struct AllCountView: View {
    let count: Int

    var body: some View {
        HStack {
            VStack {
                Image(systemName: Constants.Icons.trayCircleFill)
                    .font(.largeTitle)
                Text("All")
            }
            Spacer()
            VStack {
                Text("\(count)")
                    .font(.title)
                EmptyView()
            }
        }
        .padding()
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
    }
}

#Preview {
    AllCountView(count: 10)
}
