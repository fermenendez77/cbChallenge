//
//  Cart.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

class Cart {
    var products: [Product] = []
    var discounts: [Discount] = []
    var price: Double = 0.0
    var discountAmount: Double = 0.0
    
    var finalPrice: Double {
        price - discountAmount
    }
    
    var totalAmount: Int {
        products.count
    }
    
    func addProduct(product: Product) {
        products.append(product)
        updateFullPrice()
        updateDiscount()
    }
    
    func removeProduct(offsets: IndexSet) {
        products.remove(atOffsets: offsets)
        updateFullPrice()
        updateDiscount()
    }
    
    func add(discount: Discount) {
        discounts.append(discount)
        updateFullPrice()
        updateDiscount()
    }
    
    private func updateFullPrice() {
        price = products.map { $0.price }.reduce(0, +)
    }
    
    private func updateDiscount() {
        var amount = 0.0
        discounts.forEach {
            amount = amount + $0.calculate(products: products)
        }
        discountAmount = amount
    }
}
