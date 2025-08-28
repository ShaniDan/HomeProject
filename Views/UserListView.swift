//
//  UserListView.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        List(viewModel.users) { user in
            Text(user.name)
            
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListView()
}
