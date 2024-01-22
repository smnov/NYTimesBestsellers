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
                                    .overlay(rankView(rank: book.rank), alignment: .topLeading)
                                    
                            
                                    Text(book.title)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .scaledToFit()
                                }
                                .frame(maxWidth: 110, maxHeight: 180)
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

struct rankView: View {
    
    var rank: Int
    
    var body: some View {
        Text(String(rank))
            .foregroundColor(.black)
            .frame(width:15, height: 15)
            .background(Color(.systemGray2))
            .fontDesign(.serif)
    }
}

//#Preview {
//    BookListView()
//}
