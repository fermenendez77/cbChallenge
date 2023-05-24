//
//  TwoPerOneDiscount.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

class TwoPerOneDiscount: Discount {
    var id: String = "TwoPerOneDiscount"
    
    private let productId: String
    
    init(productId: String) {
        self.productId = productId
    }
    
    func calculate(products: [Product]) -> Double {
        let filteredItems = products.filter { $0.code == productId }
        let filteredItemsCount = filteredItems.count
        if filteredItemsCount == 0 {
            return 0.0
        } else {
            guard let price = filteredItems.first?.price else { return 0.0 }
            let discount = Double(filteredItemsCount / 2)*price
            return discount
        }
    }
}
