//
//  BudgetListItemView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

struct BudgetListItemView: View {
    @EnvironmentObject private var repository : AccountsRepository
    var account: Account
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Created at: " + "\(dateFormatter.string(from: account.createAt))")
                .padding()
            HStack{
                Text(account.name)
                    .padding()
                Spacer()
                Text("$ "+"\(account.amount)").padding()
            }
        }
    }
}

#Preview {
    BudgetListItemView(account: AccountsRepository().sampleAcoount)
}
