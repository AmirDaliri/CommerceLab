//
//  Category.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Foundation
import Apollo

struct CategoryGroup {
    let parentId: String
    let categories: [Category]
}

struct Category {
    let id: String
    let parentCategoryId: String
    let name: String
    let description: String
    let icon: String?
    let flag: String?
    let flagStyle: String?
    let picture: String?
    let genericAttributes: [GenericAttribute]
    let showOnHomePage: Bool
    let showOnSearchBox: Bool
    let includeInTopMenu: Bool
    let hideOnCatalog: Bool
    var subCategories: [Category] = []
}

struct GenericAttribute {
    let key: String
    let value: String?
    let storeId: String
}

extension FetchCategoriesQuery.Data.Category.GenericAttribute {
    func toDomain() -> GenericAttribute? {
        guard let key = key, let storeId = storeId else { return nil }
        return GenericAttribute(
            key: key,
            value: value,
            storeId: storeId
        )
    }
}

extension FetchCategoriesQuery.Data.Category {
    func toDomain() -> Category {
        let genericAttrs = genericAttributes?.compactMap { $0?.toDomain() } ?? []
        return Category(
            id: id ?? "N/A",
            parentCategoryId: parentCategoryId ?? "N/A",
            name: name ?? "N/A",
            description: description ?? "N/A",
            icon: icon,
            flag: flag,
            flagStyle: flagStyle,
            picture: picture,
            genericAttributes: genericAttrs,
            showOnHomePage: showOnHomePage,
            showOnSearchBox: showOnSearchBox,
            includeInTopMenu: includeInTopMenu,
            hideOnCatalog: hideOnCatalog
        )
    }
}
