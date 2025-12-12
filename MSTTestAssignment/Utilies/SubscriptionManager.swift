//
//  SubscriptionManager.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import Foundation
import Combine

// MARK: - SubscriptionOption

enum SubscriptionOption: String, CaseIterable, Identifiable {
    case year
    case month
    case free
    
    var id: String { rawValue }
}

final class SubscriptionManager: ObservableObject {
    
    // MARK: - Published
    
    @Published
    var selectedSubscription: SubscriptionOption
    
    // MARK: - Init
    
    init () {
        let savedOption = UserDefaults.standard.string(forKey: "Subscription")
        selectedSubscription = SubscriptionOption(rawValue: savedOption ?? SubscriptionOption.free.rawValue) ?? .free
    }
}

// MARK: - Public Methods

extension SubscriptionManager {
    
    func updateSubscription(subscribe: SubscriptionOption) {
        selectedSubscription = subscribe
        UserDefaults.standard.set(selectedSubscription.rawValue, forKey: "Subscription")
    }
    
}
