//
//  AppView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 27/05/23.
//

import Foundation
import SwiftUI

struct AppView: View {
    
    let coordinator: Coordinator
    @StateObject var appState = AppState()
    
    var body: some View {
        NavigationView {
            coordinator.listItemViewIntent()
        }
        .environmentObject(appState)
        .sheet(isPresented: $appState.isShowingCheckout) {
            coordinator.checkoutViewIntent()
        }
    }
}
