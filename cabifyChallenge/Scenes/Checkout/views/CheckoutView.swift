//
//  CheckoutView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 22/05/2023.
//

import Foundation
import SwiftUI

struct CheckoutView: View {
    
    @StateObject var viewModel: CheckoutViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.items.isEmpty {
                Text("The Cart is Empty")
            } else {
                VStack(spacing: 0.0) {
                    List {
                        ForEach(viewModel.items) { item in
                            CheckoutProductCellView(item: item)
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.removeFromCart(offsets: indexSet)
                        })
                    }
                    CheckoutTotalAmountsView(totalPrice: viewModel.fullPrice,
                                             finalPrice: viewModel.finalPrice,
                                             discountedPrice: viewModel.discountedAmountPrice, hasDiscounts: viewModel.hasDiscounts,
                                             buttonPressed: {
                        
                    })
                    .frame(alignment: .bottom)
                }
            }
        }
        .onAppear {
            viewModel.loadItems()
        }
        .navigationTitle("Checkout List")
    }
}
