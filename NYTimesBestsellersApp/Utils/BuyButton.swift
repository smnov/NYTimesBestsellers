//
//  BuyButton.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 20.01.2024.
//

import SwiftUI

struct BuyButton: View {
    
    var buyLinks: [BuyLink]
    
    var body: some View {
        Menu("Buy") {
            ForEach(buyLinks, id: \.self) { link in
                Link("\(link.name)", destination: URL(string: "\(link.url)")!)
            }
            
        }
        .frame(width: 80, height: 30)
        .background(Color(.purple))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

//#Preview {
//    BuyButton()
//}
