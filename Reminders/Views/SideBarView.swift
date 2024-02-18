//
//  SideBarView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("All items count 10")

            List(1..<10, id: \.self) { item in
                Text("List \(item)")
            }

            Spacer()

            Button("Add List") {
                print("Add list")
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
