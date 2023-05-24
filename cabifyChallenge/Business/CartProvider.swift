//
//  CartProvider.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 22/05/2023.
//

import Foundation

protocol ICartProvider {
    func createCart() -> Cart
}

class CartProvider: ICartProvider{
    
    func createCart() -> Cart {
        let cart = Cart()
        cart.add(discount: TwoPerOneDiscount(productId: "VOUCHER"))
        cart.add(discount: AmountReducedPriceDiscount(productId: "TSHIRT"))
        return cart
    }
}
