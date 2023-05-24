//
//  CheckoutTotalAmountsView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 23/05/2023.
//

import SwiftUI

struct CheckoutTotalAmountsView: View {
    
    let totalPrice: Price
    let finalPrice: Price
    let discountedPrice: Price
    let hasDiscounts: Bool
    let buttonPressed: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    if hasDiscounts {
                        Text("Price: ")
                            .strikethrough()
                            .font(.title3)
                            .foregroundColor(.white) +
                        Text(totalPrice.formatted)
                            .strikethrough()
                            .foregroundColor(.white)
                            .font(.title3)
                        
                            Text("Discounted: ")
                                .font(.title3)
                                .foregroundColor(.white) +
                            Text(discountedPrice.formatted)
                                .foregroundColor(.white)
                            .font(.title3)
                    }
                    
                    Text("Price: ")
                        .foregroundColor(.white)
                        .font(.title) +
                    Text(finalPrice.formatted)
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                MainButton(label: "Pay", action: buttonPressed)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.cyan)
        }
    }
}

struct CheckoutTotalAmountsView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutTotalAmountsView(
            totalPrice: Price(value: 50.0, currency: .eur),
            finalPrice: Price(value: 40.0, currency: .eur),
            discountedPrice: Price(value: 10.0, currency: .eur), hasDiscounts: true,
            buttonPressed: {})
    }
}
