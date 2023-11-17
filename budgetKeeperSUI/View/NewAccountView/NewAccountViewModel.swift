//
//  NewAccountViewModel.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 8/11/23.
//

import Foundation
import SwiftUI

final class NewAccountViewModel: ObservableObject {
    
    private let repository : AccountsRepository
    @Published var isLoading: Bool = false

    init(repository: AccountsRepository) {
        self.repository = repository
    }
    
    func saveAccount(name: String, amount: String) async -> Bool {
        
        guard let amount = Float(amount) else { return false }
        return await repository.addAccount(Account(name: name, amount: amount, createAt: Date()))
    }
}

