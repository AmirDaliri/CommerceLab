//
//  ContentView.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: CategoryViewModel

    init() {
        let networkService = NetworkService()
        _viewModel = StateObject(wrappedValue: CategoryViewModel(networkService: networkService))
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Loading categories...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                List(viewModel.categories, id: \.id) { category in
                    Text(category.name)
                }
            }
        }
        .onAppear {
            viewModel.loadCategories()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
