//
//  AccountsViewModel.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 8/11/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @Published var accountList: [Account] = []
    @Published var isLoading: Bool = false
    
    private var repository: AccountsRepository
    
    init(repository: AccountsRepository) {
        self.repository = repository
    }
    
    func loadAccountList() async {
        
        await MainActor.run { isLoading = true }
        let fetchedAccounts = await repository.loadAccounts()
        await MainActor.run {
            accountList = fetchedAccounts
            isLoading = false
        }
    }
}
