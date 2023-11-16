//
//  AccountsRepository.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 14/11/23.
//

import Foundation
import SwiftUI

@MainActor
final class AccountsRepository: ObservableObject{
    @Published var sampleAcoount = Account(name: "Internet", amount: 125.6, createAt: Date())
    @Published var accounts: [Account] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    private let dependencies: Dependencies

        init(dependencies: Dependencies = .default) {
            self.dependencies = dependencies
        }
    
    func loadAccounts() async{
        if !accounts.isEmpty { return }
        isLoading = true
        if let accounts = try? await dependencies.loadAccounts(){
            self.accounts = accounts
        }
        isLoading = false
    }
    
    func addAccount(_ account: Account){
        accounts.append(account)
    }
}

extension AccountsRepository{
    struct Dependencies {
        var loadAccounts: () async throws -> [Account]
        
        static var `default`: Self {
            let service = AccountsServices()
            return Dependencies(
                loadAccounts: service.loadAccounts
            )
        }
        
    }
}
