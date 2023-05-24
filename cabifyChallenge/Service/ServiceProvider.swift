//
//  ServiceProvider.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 21/05/2023.
//

import Foundation

protocol IServiceProvider {
    var productService: IProductService { get }
}

class ServiceProvider: IServiceProvider {
    
    let dataServiceProvider = HTTPService()
    
    var productService: IProductService {
        let productService = ProductService(dataServiceProvider: dataServiceProvider)
        return productService
    }
}
