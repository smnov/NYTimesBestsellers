//
//  ContentView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                CategoriesListView()
                    .tabItem {
                        Label("List", systemImage: "list.bullet.clipboard")
                    }
            }
            .accentColor(Color.purple)
        }
    }
#Preview {
    ContentView()
}
