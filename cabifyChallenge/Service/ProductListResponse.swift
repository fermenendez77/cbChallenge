//
//  ProductListResponse.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation

struct ProductListResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let code, name: String
    let price: Double
}
