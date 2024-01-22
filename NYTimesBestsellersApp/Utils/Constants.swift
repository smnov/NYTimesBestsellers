//
//  Constants.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import Foundation

let baseURL = "https://api.nytimes.com/svc/books/v3/lists/"
let API_KEY = ""
let categoriesURL = "\(baseURL)names.json?api-key=\(API_KEY)"
    
func getBooksOfCategoryURL(category: String) -> String {
    return "\(baseURL)\(category).json?api-key=\(API_KEY)"
}
