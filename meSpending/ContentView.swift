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
    @State private var expenseType = "All"
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesList(type: expenseType, sortOrder: sortOrder)
                .navigationTitle("meSpending")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $expenseType) {
                            Text("Show All Expenses")
                                .tag("All")
                            Divider()
                            ForEach(AddView.types, id: \.self) { type in
                                Text(type)
                                    .tag(type)
                            }
                        }
                    }
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort By", selection: $sortOrder) {
                            Text("$...$$$")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("$$$...$")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse)
                                ])
                        }
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
