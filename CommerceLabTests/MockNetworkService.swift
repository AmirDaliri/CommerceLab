//
//  MockNetworkService.swift
//  CommerceLabTests
//
//  Created by Amir Daliri on 19.11.2024.
//

import Combine
@testable import CommerceLab

struct MockNetworkService: NetworkProtocol {
    
    var mockResult: Result<[CommerceLab.Category], Error>
    
    func fetchCategoriesGrouped() -> AnyPublisher<[CommerceLab.CategoryGroup], Error> {
        Just(mockResult)
            .flatMap { result -> AnyPublisher<[CommerceLab.CategoryGroup], Error> in
                switch result {
                case .success(let categories):
                    let groupedCategories = self.groupCategories(categories: categories)
                    return Just(groupedCategories)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                case .failure(let error):
                    return Fail(error: error)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func groupCategories(categories: [CommerceLab.Category]) -> [CommerceLab.CategoryGroup] {
        Dictionary(grouping: categories, by: { $0.parentCategoryId })
            .map { key, value in
                CommerceLab.CategoryGroup(parentId: key, categories: value)
            }
            .sorted { $0.parentId < $1.parentId }
    }
    
    func fetchCategory(with id: String, pageNumber: Int) -> AnyPublisher<CommerceLab.CategoryV2, any Error> {
        Future { promise in
            promise(.success(CategoryV2.init(isSuccess: true, data: nil)))
        }.eraseToAnyPublisher()
    }
}
