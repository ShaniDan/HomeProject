//
//  UserDetailView.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import SwiftUI

struct UserDetailView: View {
    
    // This is how the user detail is received
    let user: UserModel
    
    var body: some View {
        NavigationStack {
            List {
                Section("Profile") {
                    Text(user.name)
                    Text(user.username)
                }
                Section("Contact") {
                    Text(user.email)
                    Text(user.phone)
                    Text(user.website)
                }
                Section("Address") {
                    Text(user.address?.street ?? "")
                    Text(user.address?.city ?? "")
                }
                Section("Company") {
                    Text(user.company?.name ?? "")
                    Text(user.company?.catchPhrase ?? "")
                    Text(user.company?.bs ?? "")
                }
                
                Section("To Do") {
                    NavigationLink(destination: ToDoListView(user: user), label: {
                        Text("Show To Do")
                    })
                }
                
                Section("Albums") {
                    NavigationLink(destination: AlbumView(user: user), label: {
                        Text("Show Albums")
                    })
                }
            }
        }
    }
}

#Preview {
    UserDetailView(user: UserModel(id: 0, name: "test1", username: "test2", email: "test3@gmail.com", address: AddressModel(street: "1", suite: "2", city: "3", zipcode: "3", geo: GeoModel(lat: "1", lng: "2")), phone: "123", website: "www.some.com", company: CompanyModel(name: "some", catchPhrase: "some2", bs: "some3")))
}
