//
//  UserModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 8/28/25.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressModel?
    let phone: String
    let website: String
    let company: CompanyModel?
}



