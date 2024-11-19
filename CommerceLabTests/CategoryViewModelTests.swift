//
//  CategoryViewModelTests.swift
//  CommerceLabTests
//
//  Created by Amir Daliri on 19.11.2024.
//

import XCTest
@testable import CommerceLab

class CategoryViewModelTests: XCTestCase {
    func testInitialState() {
        let mockService = MockNetworkService(mockResult: .success([]))
        let viewModel = CategoryViewModel(networkService: mockService)

        XCTAssertTrue(viewModel.categories.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoadCategoriesSuccess() {
        let mockCategories = [Category(id: 1, name: "Test Category", icon: "icon.png", menuId: 1, parentMenuId: nil, type: "Main")]
        let mockService = MockNetworkService(mockResult: .success(mockCategories))
        let viewModel = CategoryViewModel(networkService: mockService)

        let expectation = XCTestExpectation(description: "Categories loaded successfully")

        viewModel.loadCategories()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Simulate async behavior
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertEqual(viewModel.categories.count, 1)
            XCTAssertEqual(viewModel.categories.first?.name, "Test Category")
            XCTAssertNil(viewModel.errorMessage)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testLoadCategoriesFailure() {
        let mockService = MockNetworkService(mockResult: .failure(NSError(domain: "TestError", code: 0, userInfo: nil)))
        let viewModel = CategoryViewModel(networkService: mockService)

        let expectation = XCTestExpectation(description: "Categories failed to load")

        viewModel.loadCategories()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Simulate async behavior
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertTrue(viewModel.categories.isEmpty)
            XCTAssertNotNil(viewModel.errorMessage)
            XCTAssertEqual(viewModel.errorMessage, "The operation couldn’t be completed. (TestError error 0.)")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
