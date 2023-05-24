//
//  CartTest.swift
//  cabifyChallengeTests
//
//  Created by Fernando Menendez on 21/05/2023.
//

import XCTest
@testable import cabifyChallenge

final class CartTest: XCTestCase {
    
    func testcartCaseOne() {
        let cart = Cart()
        cart.add(discount: TwoPerOneDiscount(productId: "VOUCHER"))
        cart.add(discount: AmountReducedPriceDiscount(productId: "TSHIRT"))
        
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5))
        
        XCTAssertEqual(cart.discountAmount, 0.0)
        XCTAssertEqual(cart.price, 32.5)
        XCTAssertEqual(cart.finalPrice, 32.5)
    }
    
    func testcartCaseTwo() {
        let cart = Cart()
        cart.add(discount: TwoPerOneDiscount(productId: "VOUCHER"))
        cart.add(discount: AmountReducedPriceDiscount(productId: "TSHIRT"))
        
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        
        XCTAssertEqual(cart.discountAmount, 5.0)
        XCTAssertEqual(cart.price, 30.0)
        XCTAssertEqual(cart.finalPrice, 25.0)
    }
    
    func testcartCaseThree() {
        let cart = Cart()
        cart.add(discount: TwoPerOneDiscount(productId: "VOUCHER"))
        cart.add(discount: AmountReducedPriceDiscount(productId: "TSHIRT"))
        
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        
        XCTAssertEqual(cart.discountAmount, 4.0)
        XCTAssertEqual(cart.price, 85.0)
        XCTAssertEqual(cart.finalPrice, 81.0)
    }
    
    func testcartCaseFour() {
        let cart = Cart()
        cart.add(discount: TwoPerOneDiscount(productId: "VOUCHER"))
        cart.add(discount: AmountReducedPriceDiscount(productId: "TSHIRT"))
        
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0))
        cart.addProduct(product: Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        cart.addProduct(product: Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20))
        
        XCTAssertEqual(cart.discountAmount, 8.0)
        XCTAssertEqual(cart.price, 82.50)
        XCTAssertEqual(cart.finalPrice, 74.50)
    }
}
