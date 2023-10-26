//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//
import FirebaseFirestore
import Foundation

//viewModel for to do item list
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    
    /// Delete to do list item
    /// - Parameter id: iitem id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
