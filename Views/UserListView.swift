//
//  UserListView.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import SwiftUI

struct UserListView: View {
    
    // define a viewModel object
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(user: user))
                 {
                    Text(user.name)
                    
                }
            }
            .navigationTitle("Name")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UserListView()
}
