//
//  UserViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import Foundation

@MainActor

final class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    func fetchUsers() async {
        // guard let needs to be inside the func and use async because
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([UserModel].self, from: data)
            self.users = decoded
        } catch {
            print("Crashed: \(error)")
        }
    }
}
