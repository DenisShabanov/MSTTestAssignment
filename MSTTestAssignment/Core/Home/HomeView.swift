//
//  HomeView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Environment
    
    @EnvironmentObject
    private var subscription: SubscriptionManager
    
    // MARK: - Storage
    
    @AppStorage("hasSeenOnboarding")
    private var hasSeenOnboarding: Bool = false
    
    // MARK: - State
    
    @State
    private var showSubscriptionSheet: Bool = false
    @State
    private var showOnboarding: Bool = false

    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Контент страницы...")
        }
        .navigationTitle("Вы вошли в систему👋")
        .foregroundStyle(Color.theme.accent)
        .onAppear {
            if hasSeenOnboarding == false {
                showOnboarding = true
            } else {
                showSubscriptionSheet = subscription.selectedSubscription == .free
            }
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView {
                hasSeenOnboarding = true
                showOnboarding = false
                showSubscriptionSheet = subscription.selectedSubscription == .free
            }
        }
        .sheet(isPresented: $showSubscriptionSheet) {
            SubscriptionView {
                showSubscriptionSheet = false
            }
            .environmentObject(subscription)
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(SubscriptionManager())
    }
}
