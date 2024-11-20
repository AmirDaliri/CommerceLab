//
//  NetworkService.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Foundation
import Apollo
import Combine

struct NetworkService: NetworkProtocol {
    private let apollo: ApolloClient
    
    init(client: ApolloClient = ApolloClient(url: URL(string: "https://hcapi.sch.awstest.hebiar.com/graphql")!)) {
        self.apollo = client
    }
    
    func fetchCategoriesGrouped() -> AnyPublisher<[CategoryGroup], Error> {
        Future { promise in
            self.apollo.fetch(query: FetchCategoriesQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    if let categories = graphQLResult.data?.categories?.compactMap({ $0?.toDomain() }) {
                        promise(.success(categories))
                    } else if let errors = graphQLResult.errors {
                        promise(.failure(errors.first!))
                    } else {
                        promise(.failure(NSError(domain: "NetworkError", code: -1, userInfo: nil)))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .flatMap { categories in
            self.groupCategories(categories: categories)
        }
        .eraseToAnyPublisher()
    }
    
    private func groupCategories(categories: [Category]) -> AnyPublisher<[CategoryGroup], Never> {
        Just(categories)
            .map { categories in
                Dictionary(grouping: categories, by: { $0.parentCategoryId })
            }
            .map { groupedDict in
                groupedDict.map { key, value in
                    CategoryGroup(parentId: key, categories: value)
                }
                .sorted { $0.parentId < $1.parentId }
            }
            .eraseToAnyPublisher()
    }
}
