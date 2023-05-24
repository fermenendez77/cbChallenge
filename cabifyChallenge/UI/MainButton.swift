//
//  MainButton.swift
//  cabifyChallenge
//
//  Created by Fernando Menendez on 20/05/2023.
//

import SwiftUI

struct MainButton: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.callout)
                .foregroundColor(.white)
                .padding(8.0)
                .background(mainActionColor)
                .cornerRadius(8.0)
        })
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(label: "Button", action: {})
    }
}
