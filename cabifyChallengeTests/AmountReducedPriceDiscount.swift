//
//  AmountReducedPriceDiscount.swift
//  cabifyChallengeTests
//
//  Created by Fernando Menendez on 21/05/2023.
//

import XCTest
@testable import cabifyChallenge

final class AmountReducedPriceDiscountTest: XCTestCase {

    func testThreeProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20)
        ]
        let discount = AmountReducedPriceDiscount(productId: "TSHIRT")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 3.0)
    }
    
    func testMoreThanThreeProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20)
        ]
        let discount = AmountReducedPriceDiscount(productId: "TSHIRT")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 5.0)
    }
    
    func testLessThanThreeProducts() {
        let items = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
                     Product(code: "MUG", name: "Cabify Coffee Mug", price: 7.5),
                     Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20)
        ]
        let discount = AmountReducedPriceDiscount(productId: "TSHIRT")
        let priceDiscounted = discount.calculate(products: items)
        XCTAssert(priceDiscounted == 0.0)
    }

}
