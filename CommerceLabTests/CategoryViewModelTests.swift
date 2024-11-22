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

        XCTAssertTrue(viewModel.groupedCategories.isEmpty)
        XCTAssertFalse(!viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoadCategoriesSuccess() {
        let mockCategories: [CommerceLab.Category] = [
            CommerceLab.Category(
                id: "1",
                parentCategoryId: "99999",
                name: "Kolye",
                description: "Main category for necklaces",
                icon: "MenuItem/Kolye.png",
                flag: nil,
                flagStyle: nil,
                picture: "https://example.com/image1.png",
                genericAttributes: [
                    CommerceLab.GenericAttribute(key: "SEO_TEXT", value: "Necklaces collection", storeId: "store1")
                ],
                showOnHomePage: true,
                showOnSearchBox: true,
                includeInTopMenu: true,
                hideOnCatalog: false
            )
        ]
        let mockService = MockNetworkService(mockResult: .success(mockCategories))
        let viewModel = CategoryViewModel(networkService: mockService)

        let expectation = XCTestExpectation(description: "Categories loaded successfully")

        viewModel.loadCategories()
        /// Simulate async behavior
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertEqual(viewModel.groupedCategories.count, 1)
            XCTAssertEqual(viewModel.groupedCategories.first?.parentId, "99999")
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

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertTrue(viewModel.groupedCategories.isEmpty)
            XCTAssertNotNil(viewModel.errorMessage)
            XCTAssertEqual(viewModel.errorMessage, "The operation couldn’t be completed. (TestError error 0.)")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
