//
//  BookListViewModel.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 19.01.2024.
//

import Foundation

@MainActor final class BookListViewModel: ObservableObject {
    
    @Published var bookList: [Book]?
    
    func getBooks(category: String) async throws {
        bookList = try await NetworkManager.shared.getBookList(category: category)
    }
}
