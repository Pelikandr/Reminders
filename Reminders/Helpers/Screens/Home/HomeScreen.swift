//
//  HomeScreen.swift
//  Reminders
//
//  Created by Denys Zaiakin on 18.02.2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
            Text("List")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
