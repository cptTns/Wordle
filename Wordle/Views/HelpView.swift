//
//  HelpView.swift
//  Wordle
//
//  Created by Вячеслав Браун on 21.05.2024.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(
"""
Угадывайте слова в игре **WORDLE**.
Для этого у вас будет 6 попыток.

Каждая попытка должна состоять из 5 букв. Нажми кнопку ввода, чтобы проверить слово.

После каждой попытки цвет плитки будет меняться, чтобы показать, насколько Вы близки к правильному ответу.
"""
                )
                Divider()
                Text("**Примеры**")
                Image("Example1")
                    .resizable()
                    .scaledToFit()
                Text("Буква **Б** стоит в слове на верной позиции.")
                Image("Example2")
                    .resizable()
                    .scaledToFit()
                Text("Буква **А** присутствует в слове, но стоит на неверной позиции.")
                Image("Example3")
                    .resizable()
                    .scaledToFit()
                Text("Буква **С** и остальные буквы в слове отсутствуют.")
                Divider()
                Text("**Жмите \"Новый\" для следующей игры.**")
                Spacer()
            }
            .frame(width: min(Global.screenWidth - 40, 350))
            .navigationTitle("Правила игры")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

#Preview {
    HelpView()
}
