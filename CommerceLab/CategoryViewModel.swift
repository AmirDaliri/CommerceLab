//
//  CategoryViewModel.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import SwiftUI

final class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let networkService: NetworkProtocol

    init(networkService: NetworkProtocol) {
        self.networkService = networkService
    }

    func loadCategories() {
        isLoading = true
        errorMessage = nil

        networkService.fetchCategories { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false

                switch result {
                case .success(let categories):
                    self?.categories = categories
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
