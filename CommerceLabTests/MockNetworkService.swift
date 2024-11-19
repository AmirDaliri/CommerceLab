//
//  MockNetworkService.swift
//  CommerceLabTests
//
//  Created by Amir Daliri on 19.11.2024.
//

import Foundation
@testable import CommerceLab

struct MockNetworkService: NetworkProtocol {
    var mockResult: Result<[CommerceLab.Category], Error>

    func fetchCategories(completion: @escaping (Result<[CommerceLab.Category], any Error>) -> Void) {
        completion(mockResult)
    }
}
