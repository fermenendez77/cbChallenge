//
//  CheckoutProductCellView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 22/05/2023.
//

import SwiftUI

struct CheckoutProductCellView: View {
    
    let item: ProductListItemView
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name).font(.title2)
            Text(item.price.formatted)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CheckoutProductCellView_Previews: PreviewProvider {
    
    static let item = ProductListItemView(position: 1, name: "Product1", price: Price(value: 10.0, currency: .eur))
    
    static var previews: some View {
        CheckoutProductCellView(item: item)
    }
}
