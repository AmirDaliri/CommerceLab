//
//  CategoryViewModelTests.swift
//  CommerceLabTests
//
//  Created by Amir Daliri on 19.11.2024.
//

import XCTest
@testable import CommerceLab

class CategoryViewModelTests: XCTestCase {
    func testFetchCategoriesSuccess() {
        let mockCategories = [CommerceLab.Category(id: 1, name: "Test", icon: "icon.png", menuId: 1, parentMenuId: nil, type: "Main")]
        let mockService = MockNetworkService(mockResult: .success(mockCategories))
        let viewModel = CategoryViewModel(networkService: mockService)

        viewModel.loadCategories { categories, error in
            XCTAssertNotNil(categories)
            XCTAssertEqual(categories?.count, 1)
            XCTAssertEqual(categories?.first?.name, "Test")
            XCTAssertNil(error)
        }
    }

    func testFetchCategoriesFailure() {
        let mockService = MockNetworkService(mockResult: .failure(NSError(domain: "TestError", code: 0, userInfo: nil)))
        let viewModel = CategoryViewModel(networkService: mockService)

        viewModel.loadCategories { categories, error in
            XCTAssertNil(categories)
            XCTAssertNotNil(error)
        }
    }
}
