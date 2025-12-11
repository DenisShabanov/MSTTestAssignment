//
//  Color.swift
//  MSTTestAssignment
//
//  Created by Denis Shabanov on 11.12.2025.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundAppColor")
    let card = Color("CardBackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    
}
