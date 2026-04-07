//
//  ContentView.swift
//  DailyBudget
//
//  Created by 田島佑紀 on 2026/04/07.
//

import SwiftUI

struct ContentView: View {
    @State private var monthlyBudget: Double = 100000
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
            
            Text("今日あと使える")
                .font(.headline)
            
            Text("¥\(Int(remainingToday))")
                .font(.largeTitle)
                .bold()
            
            TextField("使った金額を入力", text: $inputAmount)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("追加") {
                if let value = Double(inputAmount) {
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
