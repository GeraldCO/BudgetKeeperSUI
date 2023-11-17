//
//  AccountsRepository.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 14/11/23.
//

import Foundation
import SwiftUI

final class AccountsRepository {
    
    private let db: AccountDataBaseRepresentable
    
    init(db: AccountDataBaseRepresentable) {
        self.db = db
    }
    
    func loadAccounts() async -> [Account] {
        //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        return db.getAllAccounts()
    }
    
    func addAccount(_ account: Account) async -> Bool {
        //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        let success = db.insertAccount(newAccount: account)
        if success {
            print("The item was succesfully inserted: \(account)")
        }
        
        return success
    }
}

