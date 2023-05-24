//
//  ProductCellView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 19/05/2023.
//

import SwiftUI

struct ProductCellView: View {
    
    let item: ProductListItemView
    let addPressed: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .foregroundColor(.white)
                        .font(.callout)
                    MainButton(label: "Add to cart", action: addPressed)
                }
                
                Spacer()
                Text(item.price.formatted)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(mainColor)
        .cornerRadius(8.0)
    }
}

struct ProductCellView_Previews: PreviewProvider {
    
    static let item = ProductListItemView(position: 1, name: "Product1", price: Price(value: 10.0, currency: .eur))
    
    static var previews: some View {
        ProductCellView(item: item,
                        addPressed: {}).padding()
    }
}
