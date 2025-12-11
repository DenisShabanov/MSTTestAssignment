//
//  OnboardingView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("Добро пожаловать!")
                .foregroundStyle(Color.theme.card)
                .font(.title)
            Text("Мы ценим ваш выбор и готовы сопровождать вас на каждом шаге продвижения на международный рынок.")
                .foregroundStyle(Color.theme.secondaryText)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            Spacer()
            NavigationLink {
                SubscriptionView()
            } label: {
                CustomButton(title: "Продолжить")
            }

        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    NavigationStack{
        OnboardingView()
    }
}
