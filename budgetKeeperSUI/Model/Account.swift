//
//  AccountModel.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import Foundation

struct Account: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let amount: Float
    let createAt: Date
}
