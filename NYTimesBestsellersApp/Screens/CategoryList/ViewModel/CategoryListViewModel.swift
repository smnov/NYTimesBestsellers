//
//  CategoryListViewModel.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 18.01.2024.
//

import Foundation

@MainActor final class CategoryListViewModel: ObservableObject {
    
    @Published var categoryList: [Category]?
    
    func getCategories() async throws {
            categoryList = try await NetworkManager.shared.getCategories()
    }
}
