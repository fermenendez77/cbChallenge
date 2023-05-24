//
//  Price.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 22/05/2023.
//

import Foundation

struct Price {
    let value: Double
    let currency: Currency
    
    var formatted: String {
       return "\(value.description) \(currency.rawValue) "
    }
}

enum Currency: String {
    case eur = "€"
    case usd = "$"
}
