//
//  AccountsViewModel.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 8/11/23.
//

import Foundation
import SwiftUI

final class AccountsViewModel: ObservableObject{
    var repository: AccountsRepository?
        
    func setup(_ repository: AccountsRepository) {
        self.repository = repository
      }
    
    func fetchAccounts() async{
        await repository?.loadAccounts()
    }
}
