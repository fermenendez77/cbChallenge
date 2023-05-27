//
//  MockProductService.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation
import Combine

class MockProductService: IProductService {
    func fetchProductList() -> AnyPublisher<[Product], Error> {
        Just(mockProductsData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
