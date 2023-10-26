//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdData: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
    isDone = state
    }
}
