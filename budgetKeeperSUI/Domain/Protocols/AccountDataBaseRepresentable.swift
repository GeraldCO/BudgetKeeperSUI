//
//  DataBase.swift
//  budgetKeeperSUI
//
//  Created by Miguel on 16/11/2023.
//

import Foundation

protocol AccountDataBaseRepresentable {
    
    func getAllAccounts() -> [Account]
    
    func insertAccount(newAccount: Account) -> Bool
    
    func deleteAccount(accountId: UUID) -> Bool
}
