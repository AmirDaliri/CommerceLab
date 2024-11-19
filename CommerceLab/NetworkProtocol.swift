//
//  NetworkProtocol.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import Apollo

protocol NetworkProtocol {
    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void)
}
