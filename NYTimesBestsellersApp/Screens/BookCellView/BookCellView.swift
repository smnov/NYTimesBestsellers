//
//  BookCellView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 18.01.2024.
//

import SwiftUI

struct BookCellView: View {
    
    var book: Book
    var inFavorites: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    AsyncImage(url: URL(string: book.book_image))
                    Text(book.title)
                        .font(.title)
                    Text("by \(book.author)")
                        .font(.title2)
                    VStack {
                        Text("Rank: #\(String(book.rank))")
                        Text("Rank last week: #\(String(book.rank_last_week))")
                    }
                    
                    BuyButton(buyLinks: book.buy_links)
                    
                    Text(book.description)
                        .padding(.bottom)
                    
                }
                
            }
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: inFavorites ? "heart.fill" : "heart")
                }
            }
        }
    }
}

//#Preview {
//    BookCellView()
//}
