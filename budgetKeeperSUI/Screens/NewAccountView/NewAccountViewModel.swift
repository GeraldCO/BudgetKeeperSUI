//
//  NewAccountViewModel.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 8/11/23.
//

import Foundation
import SwiftUI

final class NewAccountViewModel: ObservableObject {
    var repository : AccountsRepository?
    
    func setup(_ repository: AccountsRepository) {
        self.repository = repository
      }
    
    func saveAccount(name: String, amount: String) {
        guard let amount = Float(amount) else {
            // Handle invalid amount input
            return
        }

        Task {
            await repository?.addAccount(Account(name: name, amount: amount, createAt: Date()))
            await print(repository?.accounts)
        }
    }
}

