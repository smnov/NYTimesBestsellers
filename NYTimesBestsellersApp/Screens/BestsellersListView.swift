//
//  BestsellersListView.swift
//  NYTimesBestsellersApp
//
//  Created by Александр Семенов on 17.01.2024.
//

import SwiftUI

struct CategoriesListView: View {
    
    let data = MockData().data
    var body: some View {
        NavigationStack {
            List(data, id: \.self) {
                Text($0.display_name)
            }
            .onTapGesture {
                print("Selected")
            }
            .navigationTitle("Categories")
        }
        
    }
}

#Preview {
    BestsellersListView()
}
