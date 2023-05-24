//
//  cabifyChallengeApp.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 19/05/2023.
//

import SwiftUI

@main
struct cabifyChallengeApp: App {
    
    @StateObject var coordinator = Coordinator(serviceProvider: ServiceProvider(),
                                               cartProvider: CartProvider())
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                coordinator.listItemViewIntent()
            }
            .sheet(isPresented: $coordinator.isShowingCheckout) {
                coordinator.checkoutViewIntent()
            }
        }
    }
}
