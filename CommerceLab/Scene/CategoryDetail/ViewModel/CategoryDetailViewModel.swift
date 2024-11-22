//
//  CategoryV2ViewModel.swift
//  CommerceLab
//
//  Created by Amir Daliri on 22.11.2024.
//

import Foundation
import Combine

class CategoryDetailViewModel: ObservableObject {
    
    @Published var category: CategoryV2?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let networkService: NetworkProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkService: NetworkProtocol = NetworkService(), categoryId: String) {
        self.networkService = networkService
        self.loadCategoryDetail(for: categoryId)
    }

    private func loadCategoryDetail(for categoryId: String) {
        isLoading = true
        errorMessage = nil

        networkService.fetchCategory(with: categoryId, pageNumber: 1)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] categoryData in
                guard let self = self else { return }
                self.category = categoryData
            })
            .store(in: &cancellables)
    }
}
