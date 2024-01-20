//
//  BookCellView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 18.01.2024.
//

import SwiftUI

struct BookCellView: View {
    
    var body: some View {
        VStack {
            Text(book.title)
            AsyncImage(url: URL(string: book.book_image))
        }
    }
}

//#Preview {
//    BookCellView()
//}
