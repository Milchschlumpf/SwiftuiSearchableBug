//
//  SearchView.swift
//  SearchableBug
//
//  Created by Felix Pinkerneil on 23.01.26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    let items = [
        "Apple",
        "Banana",
        "Pear",
        "Strawberry",
        "Orange",
        "Peach",
        "Grape",
        "Mango"
    ]
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter {
                $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        List(filteredItems, id: \.self) { item in
            Text(item)
        }
        .navigationTitle("Fruits")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
    }
}
