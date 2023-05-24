//
//  AmountReducedPriceDiscount.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

class AmountReducedPriceDiscount: Discount {
    var id: String = "AmountReducedPriceDiscount"
    
    private let productId: String
    private let minAmount = 3
    private let priceToDiscount = 1.0
    
    init(productId: String) {
        self.productId = productId
    }
    
    func calculate(products: [Product]) -> Double {
        let filteredItems = products.filter { $0.code == productId }
        let filteredItemsCount = filteredItems.count
        if filteredItemsCount < minAmount {
            return 0.0
        } else {
            return Double(filteredItemsCount) * priceToDiscount
        }
    }
}
