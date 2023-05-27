//
//  cabifyChallengeApp.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 19/05/2023.
//

import SwiftUI

@main
struct cabifyChallengeApp: App {
    
    let coordinator = Coordinator(serviceProvider: ServiceProvider(),
                                  cartProvider: CartProvider())
    
    var body: some Scene {
        WindowGroup {
            AppView(coordinator: coordinator)
        }
    }
}
