//
//  ToDoViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/29/25.
//

import Foundation

@MainActor

final class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDosModel] = []
    
    func fetchToDos() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([ToDosModel].self, from: data)
            self.toDos = decoded
        } catch {
            print("Crashed: \(error)")
        }
    }
    
    func todos(for user: UserModel) -> [ToDosModel] {
        toDos.filter { $0.userId == user.id}
    }
  // this is the update function but might need to look into it with Mikaela
    func update() {
        var updatedToDos: [ToDosModel] = []
        for todo in toDos {
            if todo.completed {
                updatedToDos.append(todo)
            }
        }
        toDos = updatedToDos
    }
    
}
