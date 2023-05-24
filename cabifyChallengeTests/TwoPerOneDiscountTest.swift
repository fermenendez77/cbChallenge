//
//  VoucherDiscountTest.swift
//  cabifyChallengeTests
//
//  Created by Fernando Menendez on 21/05/2023.
//

import XCTest
@testable import cabifyChallenge

final class TwoPerOneDiscountTest: XCTestCase {
    
    func testOddProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)]
        
        let discount = TwoPerOneDiscount(productId: "VOUCHER")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 10.0)
    }
    
    func testEvenProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)]
        
        let discount = TwoPerOneDiscount(productId: "VOUCHER")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 5.0)
    }
    
    func testEvenDoubleProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.5),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.5),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.5),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)]
        
        let discount = TwoPerOneDiscount(productId: "VOUCHER")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 5.5)
    }
    
    func testNoProductsProducts() {
        let items = [Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)]

        let discount = TwoPerOneDiscount(productId: "VOUCHER")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 0.0)
    }
}
