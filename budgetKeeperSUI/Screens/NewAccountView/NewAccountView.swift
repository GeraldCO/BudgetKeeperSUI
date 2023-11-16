//
//  NewAccountView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

struct NewAccountView: View {
    @State private var account: String = ""
    @State private var amount: String = ""
    @State private var accountCreationDate = Date()   
    @ObservedObject var viewModel = NewAccountViewModel()
    @EnvironmentObject var repository: AccountsRepository // Inject the repository
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(){
                Text("Account").frame(width: 100)
                TextField("", text: $account)
                    .frame(width: 150)
                    .border(Color.black, width: 1)
                Spacer()
            }
            HStack{
                Text("Amount").frame(width: 100)
                TextField("", text: $amount)
                    .frame(width: 150)
                    .border(Color.black, width: 1)
            }
            HStack{
                Spacer()
                Button(
                    action: {
                        print("saved")
                        viewModel.saveAccount(name: account, amount: amount)
                        
                }, label: {
                    Text("Save")
                }).padding(8)
                Spacer()
            }
            

            Spacer()
        }
        .onAppear{
            self.viewModel.setup(self.repository)
        }
        .frame(maxWidth: .infinity )
    }
}

#Preview {
    NewAccountView()
}
