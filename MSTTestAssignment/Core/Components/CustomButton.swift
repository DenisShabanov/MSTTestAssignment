//
//  CustomButton.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: - Property
    
    var title: String
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .foregroundStyle(Color.theme.background)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.card)
            )
    }
}

// MARK: - Preview

#Preview {
    CustomButton(title: "Продолжить")
}
