//
//  Guess.swift
//  Wordle
//
//  Created by Вячеслав Браун on 19.05.2024.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .Wrong, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map  { String($0) }
    }
    
    var results: String {
        // 🟩🟨⬜️
        let tryColors: [Color : String] = [.Misplaced : "🟨", .Correct : "🟩", .Wrong : "⬜️"]
        return bgColors.compactMap {tryColors[$0]}.joined(separator: "")
    }
}
