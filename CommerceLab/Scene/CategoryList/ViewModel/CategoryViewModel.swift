//
//  CategoryViewModel.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import SwiftUI
import Combine

final class CategoryViewModel: ObservableObject {
    @Published var expandedState: [String: Bool] = [:]
    @Published var groupedCategories: [CategoryGroup] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let networkService: NetworkProtocol
    private var cancellables = Set<AnyCancellable>()

    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
        self.loadCategories()
    }

    func loadCategories() {
        isLoading = true
        errorMessage = nil

        networkService
            .fetchCategoriesGrouped()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] groupedCategories in
                self?.groupedCategories = groupedCategories
            })
            .store(in: &cancellables)
    }
}
