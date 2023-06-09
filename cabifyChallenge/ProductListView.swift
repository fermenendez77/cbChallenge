//
//  ContentView.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 19/05/2023.
//

import SwiftUI

struct ProductListView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: ProductListViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.productsItems,
                            id: \.position) { item in
                        ProductCellView(item: item,
                                        addPressed: {
                            viewModel.addProductToCart(position: item.position)
                        })
                    }
                }
            }
            if viewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            }
            if !viewModel.isLoading {
                CheckoutPartialView(totalPrice: viewModel.totalPrice,
                                    totalAmount: viewModel.totalAmount,
                                    buttonPressed: {
                    appState.isShowingCheckout = true
                })
                
            }
        }
        .navigationTitle("Products")
        .onAppear {
            viewModel.loadItems()
        }
        .onChange(of: appState.isShowingCheckout,
                  perform: { value in
            if !value {
                viewModel.reloadFromCart()
            }
        })
        .alert("Error",
               isPresented: $viewModel.showError,
               actions: {
            
        })
        .padding()
    }
}

struct CheckoutPartialView: View {
    
    let totalPrice: Price
    let totalAmount: Int
    let buttonPressed: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Total: ").foregroundColor(.white) +
                    Text(totalPrice.formatted)
                        .foregroundColor(.white)
                        .font(.title2)
                    
                    Text("Amount: ")
                        .foregroundColor(.white) +
                    Text(totalAmount.description)
                        .foregroundColor(.white)
                }
                Spacer()
                MainButton(label: "Go to Checkout", action: buttonPressed)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.cyan)
            .cornerRadius(8.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let viewModel = ProductListViewModel(
        productService: MockProductService(),
        cart: Cart())
    
    static var previews: some View {
        ProductListView(viewModel: viewModel)
    }
}
