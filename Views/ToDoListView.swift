//
//  ToDoListView.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import SwiftUI

enum TodoFetchState {
        
    case initial, loading
    case success(TodoCollection)
    case error(Error)
}

struct ToDoListView: View {
    
    let user: UserModel
    @State private var fetchState = TodoFetchState.initial
    @StateObject private var toDoListViewModel = ToDoViewModel()
    
    var body: some View {
        List {
            if toDoListViewModel.todos(for: user).isEmpty {
                Text("No Todos")
            }
        }
        ForEach(toDoListViewModel.todos(for: user)) { todo in
            Text(todo.id.description)
            Text(todo.title)
        }
        .task {
            await toDoListViewModel.fetchToDos()
        }
    }
}

#Preview {
    ToDoListView(user: UserModel(id: 0, name: "test1", username: "test2", email: "test3@gmail.com", address: AddressModel(street: "1", suite: "2", city: "3", zipcode: "3", geo: GeoModel(lat: "1", lng: "2")), phone: "123", website: "www.some.com", company: CompanyModel(name: "some", catchPhrase: "some2", bs: "some3")))
}
