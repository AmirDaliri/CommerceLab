//
//  NetworkService.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Foundation
import Apollo

struct NetworkService: NetworkProtocol {
    private let apollo: ApolloClient

    init(client: ApolloClient = ApolloClient(url: URL(string: "https://hcapi.sch.awstest.hebiar.com/graphql")!)) {
        self.apollo = client
    }

    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        let query = FetchCategoriesQuery()

        apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.menuByType?.compactMap({ $0?.toDomain() }) {
                    completion(.success(data))
                } else if let errors = graphQLResult.errors {
                    completion(.failure(errors.first!)) // Return the first error
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
