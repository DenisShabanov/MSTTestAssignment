//
//  MSTTestAssignmentApp.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import SwiftUI

@main
struct MSTTestAssignmentApp: App {
    
    // MARK: - StateObj
    
    @StateObject
    private var subscriptionManager = SubscriptionManager()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .environmentObject(subscriptionManager)
            }
        }
    }
}
