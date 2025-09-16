//
//  UserViewModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import Foundation

/* MARK: Understanding Actor, MainActor
        - Actors are a concurrency primitive that help manage shared mutable state safely.
        - Actors are as similar to classes but the difference is they automatically handle thread safety. Need to check if it's correct fully or not.
        - @MainActor is used in the Main thread, all UI updates must run on the main thread.
        - Background work (network calls, database, heavy calculations should also run on the main thread) - network calls don't happen on the Main thread
        - When the background work finishes, you switch back to the main thread to update the UI.
 
 Example code:
 
 Wrong Way:
 
 // This runs on the main thread by default
 // single threaded
 func fetchData() {
     let url = URL(string: "https://example.com/data.json")!
     let data = try! Data(contentsOf: url) // 🚨 blocks main thread
     print("Data size: \(data.count)")
 }
 
 Right Way:
 // Old way
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
 
 Swift Concurrency (async/await)
 // New way
 func fetchData() async {
     do {
         let url = URL(string: "https://example.com/data.json")!
         let (data, _) = try await URLSession.shared.data(from: url)
         
         label.text = "Downloaded \(data.count) bytes"
     } catch {
         print("Error: \(error)")
     }
 }
 */
@MainActor

final class UserViewModel: ObservableObject {
    // marks a property inside an ObservableObject so SwiftUI automatically updates any views observing it when the value changes
    // Further @StateObject is used in aview to create and own an instance of that ObservableObject (with its @Published properties), so the view can react to changes
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
            
//            let mikaela = "traveling"
//            
//            guard mikaela == "home" else {
//                // this is if it's not true
//                break
//            }
//            
//            asdf: if mikaela == "conference" {
//                // this is if it's true
//            } else {
//                break asdf
//            }
            
            
            
            // use response variable properly, for a real network request
            guard let httpResponse = response as? HTTPURLResponse else {
//                print("No HTTP response")
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                let decoded = try JSONDecoder().decode([UserModel].self, from: data)
                self.users = decoded
            } else if statusCode == 404 {
                // show error to user
            } else {
                
            }
            
           
        } catch {
            // Must show the actual error
            print("No user")
        }
    }
    
}
