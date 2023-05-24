//
//  ProductListItemView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

struct ProductListItemView: Identifiable {
    var id: String {
        "\(name) + \(position.description)"
    }
    
    let position: Int
    let name: String
    let price: Price
}
