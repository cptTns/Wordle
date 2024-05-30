//
//  SettingsView.swift
//  Wordle
//
//  Created by Вячеслав Браун on 21.05.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var csManager : ColorSchemeManager
    @EnvironmentObject var dm: WordleDataModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Сложный режим", isOn: $dm.hardMode)
                Text("Изменить оформление")
                Picker("Display Mode", selection: $csManager.colorScheme) {
                    Text("Темное").tag(ColorScheme.dark)
                    Text("Светлое").tag(ColorScheme.light)
                    Text("Системное").tag(ColorScheme.unspecified)
                }
                .pickerStyle(.segmented)
                Spacer()
            }.padding()
            .navigationTitle("Настройки")
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
    SettingsView()
        .environmentObject(ColorSchemeManager())
        .environmentObject(WordleDataModel())
}
