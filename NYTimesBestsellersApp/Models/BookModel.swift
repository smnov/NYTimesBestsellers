//
//  BookModel.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 18.01.2024.
//

import Foundation

struct Book: Codable, Hashable {
    var rank: Int
    var rank_last_week: Int
    var weeks_on_list: Int
    var asterisk: Int
    var dagger: Int
    var primary_isbn10: String
    var primary_isbn13: String
    var publisher: String
    var description: String
    var price: String
    var title: String
    var author: String
    var contributor: String
    var contributor_note: String
    var book_image: String
    var book_image_width: Int
    var book_image_height: Int
    var amazon_product_url: String
    var age_group: String
    var book_review_link: String
    var first_chapter_link: String
    var sunday_review_link: String
    var article_chapter_link: String
    var isbns: [ISBN]
    var buy_links: [buyLink]
    var book_uri: String
}

struct CategoryInBook: Codable, Hashable {
    var list_name: String
    var list_name_encoded: String
    var bestsellers_date: String
    var published_date: String
    var published_date_description: String
    var next_published_date: String
    var previous_published_date: String
    var display_name: String
    var normal_list_ends_at: Int
    var updated: String
}

struct ISBN: Codable, Hashable {
    var isbn10: String
    var isbn13: String
}

struct buyLink: Codable, Hashable {
    var name: String
    var url: String
}

struct Results: Codable, Hashable {
    var list_name: String
    var list_name_encoded: String
    var bestsellers_date: String
    var published_date: String
    var published_date_description: String
    var next_published_date: String
    var previous_published_date: String
    var display_name: String
    var normal_list_ends_at: Int
    var updated: String
    var books: [Book]
}

struct BookResponse: Codable, Hashable {
    let status: String
    let copyright: String
    let last_modified: String
    let num_results: Int
    let results: Results
}
