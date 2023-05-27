//
//  Coordinator.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    let serviceProvider: IServiceProvider
    let cartProvider: ICartProvider
    
    var cart: Cart
    
    init(serviceProvider: IServiceProvider, cartProvider: ICartProvider) {
        self.serviceProvider = serviceProvider
        self.cartProvider = cartProvider
        self.cart = cartProvider.createCart()
    }
    
    func listItemViewIntent() -> some View {
        let viewModel = ProductListViewModel(productService: serviceProvider.productService,
                                             cart: cart)
        let view = ProductListView(viewModel: viewModel)
        return view
    }
    
    func checkoutViewIntent() -> some View {
        let viewModel = CheckoutViewModel(cart: cart)
        let view = CheckoutView(viewModel: viewModel)
        return view
    }
}
