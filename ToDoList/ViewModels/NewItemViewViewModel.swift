//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdData: Date.timeIntervalSinceReferenceDate,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
