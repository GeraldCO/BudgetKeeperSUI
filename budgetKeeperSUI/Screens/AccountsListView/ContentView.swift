//
//  ContentView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var accountsRepository: AccountsRepository
    @ObservedObject var viewModel = AccountsViewModel()
    
    
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    NavigationLink{
                        NewAccountView(viewModel: NewAccountViewModel())
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .frame(width: 40, height: 40)
                    }
                }
                Text("Budget Keeper")
                    .font(.title)
                
                ForEach(viewModel.repository?.accounts ?? []){ account in NavigationLink(destination: ItemDetailsView(account: account)){
                    BudgetListItemView(account: account)
                    }
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                self.viewModel.setup(accountsRepository)
                Task {
                    await viewModel.fetchAccounts()
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create a mock AccountsViewModel for preview
//        ContentView()
//    }
//}
