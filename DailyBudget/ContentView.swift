//
//  ContentView.swift
//  DailyBudget
//
//  Created by 田島佑紀 on 2026/04/07.
//

import SwiftUI

struct ContentView: View {
    @State private var monthlyBudget: Double = 100000
    @State private var budgetInput: String = ""
    @State private var spentToday: Double = 0
    @State private var inputAmount: String = ""
    
    var dailyBudget: Double {
        monthlyBudget / 30
    }
    
    var remainingToday: Double {
        dailyBudget - spentToday
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 月予算カード
                VStack(alignment: .leading, spacing: 16) {
                    Text("月予算")
                        .font(.headline)

                    Text("¥\(Int(monthlyBudget))")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.blue.opacity(0.8))
                    
                    Divider()
                        .padding(.vertical, 4)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("月予算")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        TextField("例：100000", text: $budgetInput)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Button(action: {
                        if let value = Double(budgetInput), value > 0 {
                            monthlyBudget = value
                            budgetInput = ""
                        }
                    }) {
                        Text("予算を設定")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)

                // 今日の予算カード
                VStack(alignment: .leading, spacing: 16) {
                    Text("今日の予算")
                        .font(.headline)

                    Text("¥\(Int(remainingToday))")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(remainingToday >= 0 ? .green : .red)
                    
                    Divider()
                        .padding(.vertical, 4)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("支出金額")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        TextField("例：1200", text: $inputAmount)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Button(action: {
                        if let value = Double(inputAmount), value > 0 {
                            spentToday += value
                            inputAmount = ""
                        }
                    }) {
                        Text("追加")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
