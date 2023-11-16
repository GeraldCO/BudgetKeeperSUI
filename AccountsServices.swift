//
//  AccountsServices.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 14/11/23.
//

import Foundation

struct AccountsServices{
    func loadAccounts() async throws -> [Account] {
        //simulating a network call
        try await Task.sleep(for: .seconds(1))
        return[
            Account(name: "Cable", amount:  15.2, createAt: Date()),
            Account(name: "Internet", amount:  24.5, createAt: Date()),
            Account(name: "Grocery", amount:  154.22, createAt: Date())
        ]
    }
}
