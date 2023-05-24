//
//  ProductListViewModel.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    
    private let productService: IProductService
    private let cart: Cart
    
    @Published var productsItems: [ProductListItemView] = []
    @Published var totalPrice: Price = Price(value: 0.0, currency: .eur)
    @Published var totalAmount: Int = 0
    @Published var isLoading = false
    @Published var showError = false
    
    private var disposal = Set<AnyCancellable>()
    private var products: [Product] = []
    
    init(productService: IProductService, cart: Cart) {
        self.productService = productService
        self.cart = cart
    }
    
    func loadItems() {
        isLoading = true
        productService.fetchProductList()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    self?.showError = false
                case .failure(_):
                    self?.showError = true
                }
        }, receiveValue: { [weak self] products in
            self?.productsItems = products.enumerated().map { position, product in
                ProductListItemView(position: position,
                                    name: product.name,
                                    price: Price(value: product.price, currency: .eur))
            }
            self?.products = products
        }).store(in: &disposal)
    }
    
    func addProductToCart(position: Int) {
        let product = products[position]
        cart.addProduct(product: product)
        updateLabels()
    }
    
    func processError() {
        showError = false
        loadItems()
    }
    
    private func updateLabels() {
        totalPrice = Price(value: cart.finalPrice, currency: .eur)
        totalAmount = cart.totalAmount
    }
    
    
}
