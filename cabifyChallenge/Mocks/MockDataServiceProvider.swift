//
//  MockDataServiceProvider.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation
import Combine

class MockDataServiceProvider: DataServiceProvider {
    
    func get<T: Codable>(type: T.Type) -> AnyPublisher<T, Error> {
        [].publisher
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
