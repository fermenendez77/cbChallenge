//
//  HTTPService.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import Foundation
import Combine

protocol DataServiceProvider {
    func get<T: Codable>(type: T.Type) -> AnyPublisher<T, Error>
}

class HTTPService: DataServiceProvider {
    
    let baseurl = URL(string: "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json")!
    
    func get<T: Codable>(type: T.Type) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        let request = URLRequest(url: baseurl)
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            guard $0.data.count > 0 else { throw URLError(.zeroByteResource) }
            return $0.data
        }
        .decode(type: T.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
}
