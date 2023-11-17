//
//  NewAccountView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

enum AccoutType {
    case new, update
}

struct NewAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: NewAccountViewModel
    @State var text: String = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Spacer()
            
            TextField(
                "New Account",
                text: $text
            )
            .textFieldStyle(.plain)
            .frame(width: 108)
            
            Button("Save") {
                
                Task {
                   let wasSaved = await viewModel.saveAccount(name: text, amount: "0.0")
                
                    if wasSaved {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .foregroundStyle(.purple)
            
            Spacer()
        }
    }
}

#Preview {
    let repo = AccountsRepository(db: MockAccountDatabase.shared)
    let vm = NewAccountViewModel(repository: repo)
    return NewAccountView(viewModel: vm)
}
