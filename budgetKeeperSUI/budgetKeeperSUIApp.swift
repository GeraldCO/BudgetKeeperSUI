//
//  budgetKeeperSUIApp.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

@main
struct budgetKeeperSUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            let repo = AccountsRepository(db: MockAccountDatabase.shared)
            let vm = AccountViewModel(repository: repo)
            AccountListView(viewModel: vm)
        }
    }
}
