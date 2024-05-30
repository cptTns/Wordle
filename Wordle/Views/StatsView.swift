//
//  StatsView.swift
//  Wordle
//
//  Created by Вячеслав Браун on 21.05.2024.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        dm.showStats.toggle()
                    }
                } label: {
                    Text("X")
                }
                .offset(x: 20, y: 10)
            }
            Text("СТАТИСТИКА")
                .font(.headline)
                .fontWeight(.bold)
            HStack(alignment: .top) {
                SingleStat(value: dm.currentStat.games,
                           text: "Игр cыграно")
                if dm.currentStat.games != 0 {
                    SingleStat(value: Int((100 * dm.currentStat.wins/dm.currentStat.games)),
                               text: "Побед %")
                }
                SingleStat(value: dm.currentStat.streak,
                           text: "Побед подряд")
                SingleStat(value: dm.currentStat.streak,
                           text: "Макс. побед подряд")
                .fixedSize(horizontal: false, vertical: true)
            }
            Text("ОТГАДЫВАНИЯ СЛОВ")
                .font(.headline)
                .fontWeight(.bold)
            VStack(spacing: 5) {
                ForEach (0..<6) { index in
                    HStack {
                        Text("\(index + 1)")
                        if dm.currentStat.frequncies[index] == 0 {
                            Rectangle()
                                .offset(x: index == 0 ? 2 : 0)
                                .fill(Color.Wrong)
                                .frame(width: 22, height: 20)
                                .overlay(
                                    Text(index == 0 ? " 0" : "0")
                                        .foregroundColor(.white)
                                )
                        } else {
                            if let maxValue = dm.currentStat.frequncies.max() {
                                Rectangle()
                                    .offset(x: index == 0 ? 2 : 0)
                                    .fill((dm.tryIndex == index && dm.gameOver)
                                          ? Color.Correct 
                                          : Color.Wrong)
                                    .frame(width: CGFloat(dm.currentStat.frequncies[index])
                                           / CGFloat(maxValue) * 210,
                                           height: 20)
                                    .overlay(
                                        Text("\(dm.currentStat.frequncies[index])")
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 5),
                                        alignment: .trailing
                                    )
                            }
                        }
                        Spacer()
                    }
                }
                if dm.gameOver {
                    HStack {
                        Spacer()
                        Button {
                            dm.shareResult()
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Поделиться")
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.Correct)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 320, height: 400)
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(Color.systemBackground))
        .padding()
        .shadow(color: .black.opacity(0.3), radius: 10)
        .offset(y: -70)
    }
}

#Preview {
    StatsView()
        .environmentObject(WordleDataModel())
}

struct SingleStat: View {
    let value: Int
    let text: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.largeTitle)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}
