//
//  ProductService.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation
import Combine

protocol IProductService {
    
    func fetchProductList() -> AnyPublisher<[Product], Error>
}

class ProductService: IProductService {
    
    let dataServiceProvider: DataServiceProvider
    let decoder = JSONDecoder()
    
    internal init(dataServiceProvider: DataServiceProvider) {
        self.dataServiceProvider = dataServiceProvider
    }
    
    func fetchProductList() -> AnyPublisher<[Product], Error> {
        dataServiceProvider.get(type: ProductListResponse.self).map(\.products).eraseToAnyPublisher()
    }
}
