//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


//viewModel for single to do list item
class ToDoListItemViewViewModel: ObservableObject{
    
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
