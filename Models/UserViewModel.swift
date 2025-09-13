//
//  UserViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import Foundation

/* MARK: Understanding Actor, MainActor
        - Actors are a concurrency primitive that help manage shared mutable state safely.
        - Actors are as similar to classes but the difference is they automatically handle thread safety.
        - @MainActor is used in the Main thread, all UI updates must run on the main thread.
        - Background work (network calls, database, heavy calculations should also run on the main thread)
        - When the background work finishes, you switch back to the main thread to update the UI.
 
 Example code:
 
 Wrong Way:
 
 // This runs on the main thread by default
 
 func fetchData() {
     let url = URL(string: "https://example.com/data.json")!
     let data = try! Data(contentsOf: url) // 🚨 blocks main thread
     print("Data size: \(data.count)")
 }
 
 Right Way:
 
 func fetchData() {
     DispatchQueue.global(qos: .background).async {
         let url = URL(string: "https://example.com/data.json")!
         if let data = try? Data(contentsOf: url) {
             print("Data size: \(data.count)")
             
             // Switch back to main thread for UI updates
             DispatchQueue.main.async {
                 // ✅ Safe to update UI here
                 self.label.text = "Downloaded \(data.count) bytes"
             }
         }
     }
 }
 
 Swift Concurrency (asyn/await)
 
 func fetchData() async {
     do {
         let url = URL(string: "https://example.com/data.json")!
         let (data, _) = try await URLSession.shared.data(from: url)
         
         // Already resumes on the main thread if called from @MainActor context
         label.text = "Downloaded \(data.count) bytes"
     } catch {
         print("Error: \(error)")
     }
 }
 */
@MainActor

final class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    
    func fetchUsers() async {
        // create url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("This URL doesn't work")
            return
        }
        do {
            //network request
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // use response variable properly, for a real network request
            let decoded = try JSONDecoder().decode([UserModel].self, from: data)
            self.users = decoded
        } catch {
            // Must show the actual error
            print("No user")
        }
    }
    
}
