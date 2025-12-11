//
//  SubscriptionView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

// MARK: - Enum

enum SubscriptionType {
    case yearly
    case monthly
}

struct SubscriptionView: View {
    
    // MARK: - State
    
    @State
    private var selectedSubscription: SubscriptionType? = .yearly
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 15) {
            subscriptionOffer
            subscriptionOptions
            
            if (selectedSubscription != nil) {
                CustomButton(title: "Оформить подписку")
            } else {
                CustomButton(title: "Продолжить без подписки")
            }
        }
        .padding()
        .font(.title2)
        .multilineTextAlignment(.center)
    }
    
}

// MARK: - Layout

extension SubscriptionView {
    
    private var subscriptionOffer: some View {
        VStack(spacing: 0) {
            Text("Предлагаем оформить подписку")
                .foregroundStyle(Color.theme.card)
            Text("для получения более выгодных предложений!")
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
    
    private var subscriptionOptions:some View{
        VStack(spacing: 15) {
            SubscriptionRowView(
                title: "Годовая",
                price: "90$ год",
                isSelected: Binding(
                    get: { selectedSubscription == .yearly },
                    set: {
                        if $0 {
                            selectedSubscription = .yearly
                        } else {
                            selectedSubscription = nil
                        }
                    }
                )
            )
            SubscriptionRowView(
                title: "Месячная",
                price: "12$ мес.",
                isSelected: Binding(
                    get: { selectedSubscription == .monthly },
                    set: {
                        if $0 {
                            selectedSubscription = .monthly
                        } else {
                            selectedSubscription = nil
                        }
                    }
                )
            )
        }
    }
    
}


// MARK: - Preview

#Preview {
    SubscriptionView()
}
