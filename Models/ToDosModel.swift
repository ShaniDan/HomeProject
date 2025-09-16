//
//  ToDosModel.swift
//  HomeProject
//
//  Created by Shakhnoza Mirabzalova on 9/16/25.
//


struct ToDosModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Int
}