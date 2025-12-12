//
//  OnboardingView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Property
    
    var onFinish: (() -> Void)?
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            text
            Spacer()
            CustomButton(title: "Продолжить")
                .onTapGesture {
                    onFinish?()
                }

        }
        .padding()
    }
}

// MARK: - Layout

extension OnboardingView {
    
    private var text: some View {
        Group {
            Text("Добро пожаловать!")
                .foregroundStyle(Color.theme.card)
                .font(.title)
            Text("Мы ценим ваш выбор и готовы сопровождать вас на каждом шаге продвижения на международный рынок.")
                .foregroundStyle(Color.theme.secondaryText)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
    
}

// MARK: - Preview

#Preview {
    OnboardingView()
}
