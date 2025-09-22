//
//  AlbumView.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import SwiftUI

struct AlbumView: View {
    
    let user: User
    
    // MARK: @StateObject private var viewModel: AlbumViewModel - Only declares the property. It says this view owns a StateObject of type AlbumViewModel but it's not creating it here. The actual AlbumViewModel needs to be passed from outside (usually via the view's initializer)
    
    // this declares and initializes the StateObject at the same time. SwiftUI will create and AlbumViewModel() when the view is 1st built and it will manage its lifetime.
    
    @StateObject private var viewModel = AlbumViewModel()
    
    var body: some View {
        List(viewModel.album(for: user)) { item in
            Text(item.title)
            
        }
        .task {
            await viewModel.fetchAlbums()
        }
    }
}

#Preview {
    AlbumView(user: User(id: 0, name: "test1", username: "test2", email: "test3@gmail.com", address: Address(street: "1", suite: "2", city: "3", zipcode: "3", geo: Geo(lat: "1", lng: "2")), phone: "123", website: "www.some.com", company: Company(name: "some", catchPhrase: "some2", bs: "some3")))
}
