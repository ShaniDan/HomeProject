//
//  AddressModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 9/16/25.
//


import Foundation

struct AddressModel: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoModel?
}
