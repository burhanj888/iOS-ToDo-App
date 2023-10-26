//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//
import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _,user in DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""
        }
        }
    }
    
    public var isSignedInd: Bool {
        return Auth.auth().currentUser != nil
    }
}
