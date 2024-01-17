//
//  ContentView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BestsellersListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.clipboard")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContentView()
}
