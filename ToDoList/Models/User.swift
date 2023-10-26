//
//  User.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
