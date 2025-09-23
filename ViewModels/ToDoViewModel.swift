//
//  ToDoViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/29/25.
//

import Foundation

/// <#Description#>
@MainActor

final class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    /// fetches the todos
    ///
    func fetchToDos() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([ToDo].self, from: data)
            self.toDos = decoded
        } catch {
            print("No todos")
        }
    }
    
    func todos(for user: User) -> [ToDo] {
        toDos.filter { $0.userId == user.id}
    }
    
  // this is the update function but might need to look into it
//    func update() {
//        var updatedToDos: [ToDosModel] = []
//        for todo in toDos {
//            if todo.completed {
//                updatedToDos.append(todo)
//            }
//        }
//        toDos = updatedToDos
//    }
    
}
