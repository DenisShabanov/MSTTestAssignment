//
//  HomeView.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Контент страницы...")
        }
        .navigationTitle("Вы вошли в систему👋")
        .foregroundStyle(Color.theme.accent)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        HomeView()
    }
}
