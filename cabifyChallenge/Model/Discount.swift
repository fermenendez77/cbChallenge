//
//  Discount.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

protocol Discount {
    var id: String  { get }
    func calculate(products: [Product]) -> Double
}
