//
//  ToastView.swift
//  Wordle
//
//  Created by Вячеслав Браун on 19.05.2024.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

#Preview {
    ToastView(toastText: "Оу! Такого слова нет в словаре игры! Попробуйте слово ИСКРА")
}
