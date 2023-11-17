//
//  ContentView.swift
//  budgetKeeperSUI
//
//  Created by Gerald on 3/11/23.
//

import SwiftUI

struct AccountListView: View {
    
    @ObservedObject var viewModel: AccountViewModel
    
    private func formattedDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    @ViewBuilder
    private var topHeader: some View {
        
        VStack(alignment: .leading) {
            
            HStack{
                
                Spacer()
                
                NavigationLink(destination: {
                    // navigate
                    let repo = AccountsRepository(db: MockAccountDatabase.shared)
                    let vm = NewAccountViewModel(repository: repo)
                    NewAccountView(viewModel: vm)
                }, label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .foregroundStyle(.purple)
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                })
            }
            
            // Title
            Text("Budget Keeper")
                .font(.title)
        }
    }
    
    @ViewBuilder
    private var accountList: some View {
        
        ScrollView {
            
            ForEach(viewModel.accountList, id: \.id) { account in
                
                accountItemCell(account)
                // TODO: Implement onTap()
            }
        }
    }
    
    @ViewBuilder
    private func accountItemCell(_ item: Account) -> some View {
        
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(item.name)
                    .foregroundStyle(.white)
                    .font(.title)
                
                Text("created At: " + formattedDate(date: item.createAt))
                    .foregroundStyle(.white)
                    .font(.title3)
            }
            
            Spacer()
            
            Text("$ " + String(item.amount))
                .foregroundStyle(.white)
                .font(.title2)
        }
        .frame(height: 100)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [
                        Color.purple,
                        Color.purple.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )))
    }
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                
                topHeader
                
                if viewModel.isLoading {
                    HStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding()
                        
                        Spacer()
                    }
                } else {
                    accountList
                }
                Spacer()
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.loadAccountList()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let repo = AccountsRepository(db: MockAccountDatabase.shared)
        let vm = AccountViewModel(repository: repo)
        AccountListView(viewModel: vm)
    }
}
