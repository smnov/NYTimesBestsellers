//
//  CategoryModel.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import Foundation

struct Category: Codable, Hashable {
    let list_name: String
    let display_name: String
    let list_name_encoded: String
    let oldest_published_date: String
    let newest_published_date: String
    let updated: String
}

struct CategoryResponse: Codable {
    let status: String
    let copyright: String
    let num_results: Int
    let results: [Category]
}

//struct MockData {
//    let data: [Category] = [
//    Category(list_name: "Combined Print and E-Book Fiction",
//                  display_name: "Combined Print & E-Book Fiction",
//                  list_name_encoded: "combined-print-and-e-book-fiction",
//                  oldest_published_date: Date(),
//                  newest_published_date: Date(),
//                  updated: "WEEKLY"),
//    Category(list_name: "Hardcover Fiction",
//                  display_name: "Hardcover Fiction",
//                  list_name_encoded: "hardcover-fiction",
//                  oldest_published_date: Date(),
//                  newest_published_date: Date(),
//                  updated: "WEEKLY")
//    
//    ]
//}
