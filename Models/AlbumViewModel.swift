//
//  AlbumViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/29/25.
//

import Foundation

@MainActor

final class AlbumViewModel: ObservableObject {
    @Published var albums: [AlbumModel] = []
    
    func fetchAlbums() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded =  try JSONDecoder().decode([AlbumModel].self, from: data)
            self.albums = decoded
        } catch {
            print("Crashed: \(error)")
        }
    }
    func album(for user: UserModel) -> [AlbumModel] {
        albums.filter { $0.userId == user.id}
    }
}
