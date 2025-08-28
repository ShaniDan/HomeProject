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

struct AddressModel: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoModel?
}

struct GeoModel: Codable {
    let lat: String
    let lng: String
}

struct CompanyModel: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
