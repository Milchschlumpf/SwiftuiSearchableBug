//
//  MainView.swift
//  SearchableBug
//
//  Created by Felix Pinkerneil on 23.01.26.
//

import SwiftUI

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

#Preview {
    MainView()
}
