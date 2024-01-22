//
//  BestsellersListView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import SwiftUI

struct CategoriesListView: View {
    
    @StateObject var viewmodel = CategoryListViewModel()
    
    var body: some View {
        NavigationStack {
            if let categories = viewmodel.categoryList {
                List(categories, id: \.self) { category in
                        NavigationLink(category.display_name, destination: BookListView(category: category))
                }
                .navigationTitle("Categories")
            } else {
                LoadingView()
            }
        }
        .task {
            do {
                try await viewmodel.getCategories()
            } catch {
                print(error)
                }
            }
        }
}
        

#Preview {
    CategoriesListView()
}
