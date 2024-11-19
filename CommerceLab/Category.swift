//
//  Category.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Foundation
import Apollo

struct Category {
    let id: Int
    let name: String
    let icon: String
    let menuId: Int
    let parentMenuId: Int?
    let type: String
}

extension FetchCategoriesQuery.Data.MenuByType {
    func toDomain() -> Category {
        return Category(
            id: id,
            name: name ?? "N/A",
            icon: icon ?? "N/A",
            menuId: menuId,
            parentMenuId: parentMenuId,
            type: type ?? "N/A"
        )
    }
}
