//
//  MockAccountDatabase.swift
//  budgetKeeperSUI
//
//  Created by Miguel on 16/11/2023.
//

import Foundation

final class MockAccountDatabase: AccountDataBaseRepresentable {
    
    static var shared = MockAccountDatabase()
    
    private init() { }

    private var accountList: [Account] = [
        Account(name: "Cable", amount:  15.2, createAt: Date()),
        Account(name: "Internet", amount:  24.5, createAt: Date()),
        Account(name: "Grocery", amount:  154.22, createAt: Date())
    ]
    
    func getAllAccounts() -> [Account] {
        accountList
    }
    
    func insertAccount(newAccount: Account) -> Bool {
        accountList.append(newAccount)
        return true
    }
    
    func deleteAccount(accountId: UUID) -> Bool {
        // TODO: implement this func
        return true
    }
}
