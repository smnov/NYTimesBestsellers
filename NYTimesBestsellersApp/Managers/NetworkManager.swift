//
//  NetworkManager.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case invalidResponseCode
    case notFound
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getImage(fromUrl url: String?) async throws -> UIImage {
        guard let urlString = url, let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw NetworkError.invalidResponseCode
            }
            return UIImage(data: data)!
        } catch {
            throw error
        }
    }
    
    func getCategories() async throws -> [Category] {
        guard let url = URL(string: categoriesURL) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        switch statusCode {
            case 404:
                throw NetworkError.notFound
            case 200:
                break
            default:
                throw NetworkError.invalidResponseCode
        }
        if statusCode != 200 {
            throw NetworkError.invalidResponseCode
        }
        
        let decodedData = try JSONDecoder().decode(CategoryResponse.self, from: data)
        let categories = decodedData.results
        return categories
    }
    
    func getBookList(category: String) async throws -> [Book] {
        guard let url = URL(string: getBooksOfCategoryURL(category: category)) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        if statusCode != 200 {
            throw NetworkError.invalidResponseCode
        }
        
        let decodedData = try JSONDecoder().decode(BookResponse.self, from: data)
        let books = decodedData.results.books
        return books
    }
}
