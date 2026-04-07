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
        VStack(spacing: 20) {
            Text("月予算設定")
                .font(.headline)
            
            TextField("月の予算を入力", text: $budgetInput)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("予算を設定") {
                if let value = Double(budgetInput), value > 0 {
                    monthlyBudget = value
                    budgetInput = ""
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("月予算: ¥\(Int(monthlyBudget))")
                .font(.subheadline)
            
            Divider()
            
            Text("今日の予算")
                .font(.headline)
            
            Text("¥\(Int(remainingToday))")
                .font(.largeTitle)
                .bold()
            
            TextField("使った金額を入力", text: $inputAmount)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("追加") {
                if let value = Double(inputAmount), value > 0 {
                    spentToday += value
                    inputAmount = ""
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
