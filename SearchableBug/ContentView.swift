//
//  ContentView.swift
//  SearchableBug
//
//  Created by Felix Pinkerneil on 23.01.26.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Page = Page.main
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    switch selectedTab {
                    case .main:
                        MainView()
                    case .search:
                        SearchView()
                    }
                }
                
                VStack {
                    Spacer()
                    
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
                        .shadow(color: Color.gray, radius: 0)
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                }
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

enum Page {
    case main
    case search
}
