//
//  ItemDetailsView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

struct ItemDetailsView: View {
    var account : Account
    var body: some View {
        Text("Update Acoount")
        
        TextField(text: .constant(""), prompt: Text("Amount")){
            Text( String(account.amount))
        }
        
        Button(action: {}, label: {
            Text("Update")
        })
        Spacer()
    }
}

#Preview {
    ItemDetailsView(account: AccountsRepository().sampleAcoount)
}
