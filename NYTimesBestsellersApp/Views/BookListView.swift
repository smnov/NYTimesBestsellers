//
//  BookListView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 18.01.2024.
//

import SwiftUI

struct BookListView: View {
    
    var category: Category
    @StateObject var viewmodel = BookListViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                if let books = viewmodel.bookList {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(books, id: \.self) { book in
                            NavigationLink(destination: BookCellView(book: book)) {
                                VStack(spacing: 8) {
                                    AsyncImage(url: URL(string: book.book_image)) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                        } else {
                                            Image("placeholder")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                        }
                                    }
                                    .frame(width: 105, height: 155)
                                    Text(book.title)
                                        .font(.caption)
                                }
                            }
                        }
                        .border(.gray, width:1)
                        .padding()
                    }
                    .navigationTitle(category.display_name)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            do {
                try await viewmodel.getBooks(category: category.list_name_encoded) 
            } catch {
                print(error)
                }
        }
        
    }
}

//#Preview {
//    BookListView()
//}
