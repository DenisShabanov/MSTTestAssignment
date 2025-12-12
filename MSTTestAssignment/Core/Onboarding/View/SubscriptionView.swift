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
    private var selectedSubscription: SubscriptionType?
    var onFinish: (() -> Void)?
    
    //MARK: - EnvironmentObject
    
    @EnvironmentObject
    private var subscription: SubscriptionManager
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 15) {
            subscriptionOffer
            subscriptionOptions
            
            CustomButton(
                title: selectedSubscription != nil ?
                "Оформить подписку" : "Продолжить без подписки"
            )
            .onTapGesture {
                subscription.updateSubscription(
                    subscribe: selectedSubscription == .monthly ?
                        .month : selectedSubscription == .yearly ?
                        .year : .free
                )
                onFinish?()
            }
        }
        .padding()
        .font(.title2)
        .multilineTextAlignment(.center)
        .onAppear {
            syncSelectedSubscription()
        }
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

// MARK: - Private Methods

extension SubscriptionView {
    
    private func syncSelectedSubscription() {
        switch subscription.selectedSubscription {
        case .year:
            selectedSubscription = .yearly
        case .month:
            selectedSubscription = .monthly
        case .free:
            selectedSubscription = nil
        }
    }
}


// MARK: - Preview

#Preview {
    SubscriptionView()
        .environmentObject(SubscriptionManager())
}
