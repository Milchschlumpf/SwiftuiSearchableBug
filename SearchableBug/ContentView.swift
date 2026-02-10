//
//  ContentView.swift
//  SearchableBug
//
//  Created by Felix Pinkerneil on 23.01.26.
//

import SwiftUI

enum Page {
    case main
    case search
}

struct ContentView: View {
    @State var selectedTab: Page = Page.main
    
    var body: some View {
        NavigationStack {
            VStack {
                switch selectedTab {
                case .main:
                    MainView()
                case .search:
                    SearchView()
                }
                
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        TabBarIcon(iconName: "house", selected: selectedTab == .main, displayName: "Home")
                            .onTapGesture {
                                selectedTab = .main
                            }
                        
                        TabBarIcon(iconName: "magnifyingglass", selected: selectedTab == .search, displayName: "Search")
                            .onTapGesture {
                                selectedTab = .search
                            }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray)
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

struct TabBarIcon: View {
    
    let iconName: String
    let selected: Bool
    let displayName: String
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.black)
                    .frame(width:  22, height:  22)
                
                Text(displayName)
                    .font(Font.system(size: 10))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .navigationTitle("Home")
    }
}

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

