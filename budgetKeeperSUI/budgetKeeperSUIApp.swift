//
//  budgetKeeperSUIApp.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

@main
struct budgetKeeperSUIApp: App {
    @StateObject private var accountsRepository = AccountsRepository()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AccountsRepository())
                
        }
    }
}
