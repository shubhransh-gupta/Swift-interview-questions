//
//  DataModel.swift
//  HopeAdoodledo
//
//  Created by Shubhransh Gupta on 15/01/25.
//

import Foundation

//https://jsonplaceholder.typicode.com/todos/1

struct User: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
}

struct Driver: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
}
