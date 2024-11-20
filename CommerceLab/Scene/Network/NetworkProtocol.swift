//
//  NetworkProtocol.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Combine

protocol NetworkProtocol {
    func fetchCategoriesGrouped() -> AnyPublisher<[CategoryGroup], Error>
}
