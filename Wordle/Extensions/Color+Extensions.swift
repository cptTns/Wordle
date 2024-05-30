//
//  Color+Extensions.swift
//  Wordle
//
//  Created by Вячеслав Браун on 19.05.2024.
//

import SwiftUI

extension Color {
    static var Wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    static var Misplaced: Color {
        Color(UIColor(named: "misplaced")!)
    }
    static var Correct: Color {
        Color(UIColor(named: "correct")!)
    }
    static var Unused: Color {
        Color(UIColor(named: "unused")!)
    }
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}
