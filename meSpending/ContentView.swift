//
//  ContentView.swift
//  meSpending
//
//  Created by Leila on 12/16/23.
//

import SwiftData
import SwiftUI

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}

struct ContentView: View {
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            ExpensesList()
                .navigationTitle("meSpending")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
