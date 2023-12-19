//
//  View-ExpenseStyle.swift
//  meSpending
//
//  Created by Leila on 12/19/23.
//

import SwiftUI

extension View {
    func expenseStyle(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title2)
        }
    }
}
