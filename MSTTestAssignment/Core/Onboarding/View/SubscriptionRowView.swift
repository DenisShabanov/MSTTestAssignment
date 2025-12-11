//
//  SubscriptionRowView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct SubscriptionRowView: View {
    
    // MARK: - Priperties
    
    var title: String
    var price: String
    
    // MARK: - Binding
    
    @Binding
    var isSelected: Bool
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("\(title):")
            Toggle(price, isOn: $isSelected)
                .toggleStyle(
                    SwitchToggleStyle(
                    tint: Color.theme.card
                ))
        }
        .foregroundStyle(Color.theme.accent)
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.secondaryText.opacity(0.05))
        )
    }
}

// MARK: - Preview

#Preview {
    SubscriptionRowView(title: "Годовая подписка", price: "90$ год", isSelected: .constant(true))
    SubscriptionRowView(title: "Месячная подписка", price: "10$ мес.", isSelected: .constant(false))

}
