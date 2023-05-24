//
//  CheckoutViewModel.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 22/05/2023.
//

import Foundation
import Combine

class CheckoutViewModel: ObservableObject {
    
    let cart: Cart
    @Published var items: [ProductListItemView] = []
    @Published var fullPrice: Price = Price(value: 0.0, currency: .eur)
    @Published var finalPrice: Price = Price(value: 0.0, currency: .eur)
    @Published var discountedAmountPrice: Price = Price(value: 0.0, currency: .eur)
    
    init(cart: Cart) {
        self.cart = cart
    }
    
    var hasDiscounts: Bool {
        cart.discountAmount > 0.0
    }
    
    func loadItems() {
        items = cart.products.enumerated().map { position, product in
            ProductListItemView(position: position,
                                name: product.name,
                                price: Price(value: product.price, currency: .eur))
        }
        updateAmountsView()
    }
    
    func removeFromCart(offsets: IndexSet) {
        cart.removeProduct(offsets: offsets)
        items.remove(atOffsets: offsets)
        updateAmountsView()
    }
    
    private func updateAmountsView() {
        fullPrice = Price(value: cart.price, currency: .eur)
        finalPrice = Price(value: cart.finalPrice, currency: .eur)
        discountedAmountPrice = Price(value: cart.discountAmount, currency: .eur)
    }
}
